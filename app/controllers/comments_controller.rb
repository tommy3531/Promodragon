class CommentsController < ApplicationController
	
	def new
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new
		@comment.post_id = @post.id
		@comment.user_id = current_user.id
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create!(comment_params)
		@comment.post_id = params[:post_id]
		if @comment.save
			redirect_to forum_index_path
			# redirect_to post_comment_path(@post, @comment)
		else
			flash.now[:danger] = "error"
		end
	end

	def show
		@post = Post.find(params[:post_id])
	end

  	private

    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :content)
    end
end
