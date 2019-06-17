class ProfilesController < ApplicationController
  def show
    @user = current_user
    @cards = @user.business_cards
  end
end
