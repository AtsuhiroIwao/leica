class Public::PostsController < ApplicationController
  def index
    @posts=Post.all
  end

  def new
    @post=Post.new
  end

  def create
    @post=Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to public_post_path(@post.id),flash:{notice:'投稿に成功しました'}
    else
      render :new
    end
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to public_user_path(current_user.id)
  end

  def show
    @post=Post.find(params[:id])
    @comment = Comment.new
  end

    def search
    if params[:keyword].present?
      @posts= Post.where('brands LIKE ?', "%#{params[:keyword]}%").or(Post.where('makers LIKE ?', "%#{params[:keyword]}%"))
      @keyword = params[:keyword]
    else
      @posts = Post.all
    end
    end

  private

  def post_params
    params.require(:post).permit(:body, :post_image, :brands, :makers)
  end

end
