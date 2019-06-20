class GreenRoomController < ApplicationController
  before_action :authenticate_user!

  def show
    @cards = BusinessCard.all
  end

  def find(id)
    @user = User.find(id)
  end
end
