class PostsController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @post = @user.posts.create(post_params)
        redirect_to user_path(@user)
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
