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
            redirect_to user_path(@user)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @user = @post.user
        begin
          @post.destroy
        rescue => e
            flash[:alert] = "Error: #{e.message}"
            raise ActiveRecord::Rollback
        end


        redirect_to user_path(@user), status: :see_other
    end

    private
        def post_params
            params.require(:post).permit(:title, :content)
        end

end
