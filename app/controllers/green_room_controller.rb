class GreenRoomController < ApplicationController
  before_action :authenticate_user!

  def show
    @cards = BusinessCard.all
  end
end
