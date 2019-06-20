class GreenRoomController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @cards = @user.business_cards
  end
end
