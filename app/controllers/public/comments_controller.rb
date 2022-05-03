class Public::CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.customer_id = current_customer.id
    comment.post_id = @post.id
    comment.save
    redirect_to public_post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to public_post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
