class PostsController < ApplicationController

  # CREATE
  def new
        @post = Post.new   # create a blank object for the form_for helper to use
  end

  def create
    # Multi-step way to create a new Post record in the database
    # for when we have to add some data that is not in the submitted
    # form (i.e., the user ID from the currently logged-in user):
    # First make a .new object, set the extra field, then .save
    @post = Post.new( post_params )  # strong params
    @post.user = @current_user
    # raise "hell"
    # could also write: post.user_id = @current_user.id
    @post.save
    if @post.persisted?
      redirect_to posts_path # redirect to index
    else
      # @mixtape did not get saved to the DB
      flash[:errors] = @post.errors.full_messages # an array of error strings we can print
      # redirect_to new_post_path
      # Render a *different* action's template (new instead of create)
      # We do this so the form can be pre-populated with the values typed
      # in by the user when they submitted it the first time
      render :new
    end
    # OR: @current_user.posts.create post_params
  end

    # READ
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
    @comment.post_id = @post.id
    @comment.save
  end

  # UPDATE
  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]  # key comes from /posts/:id
    # Check that the owner of this post is STILL the logged-in user
    # (i.e. the ID in the edit form action was not tampered with)
    unless @post.user == @current_user
      redirect_to(posts_path) # this alone does not stop the action
    return  # stop the rest of the action from running! i.e. the update below
    end
    # check whether the update actually changed the DB or not
    # (.update returns true if it did change the DB, false if there was an error)
    if @post.update( post_params )
      # successfully updated the DB
      redirect_to post_path(@post) # redirect to show page
    else
      # error updating
      flash[:errors] = @post.errors.full_messages
      render :edit   # Render the edit template to show the form, even though this is the update action
    end
  end

  # DESTROY
  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to( posts_path )
  end

  private

    #Security for the the CREATE and UPDATE
    def post_params
        params.require(:post).permit(:title, :content, :category_id, :image)
    end
end
