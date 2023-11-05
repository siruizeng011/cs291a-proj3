class CommentsController < ApplicationController
    def index
        @comments = Comment.all
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def new
        @comment = Comment.new
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        if @comment.save
            redirect_to post_path(@post)
        else
            render :new, status: :unprocessable_entity
        end
      end

    # def destroy
    #     @comment = Comment.find(params[:id])
    #     @comment.destroy
    #     # @post = Post.find(params[:post_id])
    #     # @comment = @post.comments
    #     # @comment.destroy
    #     # # find which user is this post belongs to
    #     # @user = @post.user
    #     # redirect_to post_path(@post), status: :see_other
    #     # if Post.find(params[:post_id]) == nil
    #     #     redirect_to user_path(@user)
    #     # else
    #     #     redirect_to post_path(@post), status: :see_other
    #     # end
    # end

    private
        def comment_params
            params.require(:comment).permit(:content)
        end
end
