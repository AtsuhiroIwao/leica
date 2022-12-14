class Public::CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post_comment = current_user.comments.new(comment_params)
    post_comment.post_id = post.id
    post_comment.save
    redirect_to public_post_path(post)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to public_post_path(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:reply)
  end

end
