class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @user = User.find(params[:user_id])
        @post = @user.posts.new(post_params)
        if @post.save
            redirect_to @post
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def destroy
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:id])
        @post.destroy
        redirect_to user_path(@user), status: :see_other
    end

    private
        def post_params
            params.require(:post).permit(:title, :content)
        end
    
end
