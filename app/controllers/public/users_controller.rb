class Public::UsersController < ApplicationController

before_action :set_user, only: [:likes]

  def show
    @users=User.all
    @user=User.find(params[:id])
    @posts=@user.posts
  end

  def edit
    @user=User.find(params[:id])
    unless current_user.id  ==  @user.id
      redirect_to public_user_path(current_user.id)
    end
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    redirect_to public_user_path(@user.id),flash:{notice:'更新に成功しました'}
  end

  def destroy
  end

  def index
    @users=User.where.not(id: current_user.id)
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def search
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
      @user=params[:name]
    else
      # flash[:notice] = "※該当するユーザーがいません"
      @users = User.none
    end
  end

  def likes
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

end
