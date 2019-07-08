class ForumController < ApplicationController
  def index
    @post = Post.all
    @comments = Comment.all
  end
end
