class PostsController < ApplicationController

  # CREATE
      def new
        @post = Post.new   # create a blank object for the form_for helper to use
      end

      def create
        Post.create member_params  # pass in the strong version of the form params
        redirect_to( members_path )  # redirect to the index "/members_path"
      end

      # READ
      def index
        @posts = Post.all
      end

      def show
        @post = Post.find params[:id]  # ID is in params because of the route "/memebrs/:id"
      end

      # UPDATE
      def edit
        @post = Post.find params[:id]
      end

      def update
        @post = Post.find params[:id]   # route is PATCH "/members/:id", so we have the ID in params
        @post.update member_params
        redirect_to member_path(@posts.id)
      end

      # DESTROY
      def destroy
        @post = Post.find params[:id]
        @post.destroy
        redirect_to( members_path )
      end

      private

      #Security for the the CREATE and UPDATE
      def post_params
        params.require(:post).permit(:name, :about, :title, :seat, :image, :party_id)
      end
end
