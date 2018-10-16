class CommentsController < ApplicationController
  def create
  @comment = Comment.new(comment_params)
  @comment.post_id = params[:post_id]
  @comment.save

  redirect_to post_path(@comment)
end

# UPDATE
    def edit
      @comment = Comment.find params[:id]
    end

    def update

      #@post = Post.find(params[:post_id])
      @comment = Comment.find params[:id]   # route is PATCH "/members/:id", so we have the ID in params
      @comment.update comment_params
      redirect_to posts_path
    end

def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end
end

private
def comment_params
  params.require(:comment).permit(:name, :comment)
end
