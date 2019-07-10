class CommentsController < ApplicationController
	
	def new
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.post_id = params[:post_id]
		# @post = Post.find(params[:post_id])
		# @comment = @post.comments
		# if @comment.save
		# 	redirect_to @post
		# else
		# 	flash.now[:danger] = "error"
		# end
	end

	def show
		@post = Post.find(params[:post_id])
		@comment = @post.comments
	end

  	private

    def comment_params
      params.require(:comment).permit(:post_id, :content)
    end
end
