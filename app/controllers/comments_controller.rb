class CommentsController < ApplicationController
  def create
  @comment = Comment.create({name: params[:name], comment: params[:comment]})
  @comment.post_id = params[:post_id]
  #raise "hell"

  flash[:errors] = @comment.errors.full_messages

  @comment.save


  redirect_to post_path(@comment.post)
end

# UPDATE
    def edit
      @comment = Comment.find params[:id]
    end

    def update

      #@post = Post.find(params[:post_id])
      @comment = Comment.find params[:id]
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
