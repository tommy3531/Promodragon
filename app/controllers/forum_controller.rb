class ForumController < ApplicationController
  def index
    @post = Post.all

  end
end
