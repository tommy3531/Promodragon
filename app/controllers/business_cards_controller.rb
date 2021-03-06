class BusinessCardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_business_card, only: [:show, :edit, :update, :destroy]
  
  def show
  end

  def new
    @business_card = current_user.business_cards.build
  end

  def edit
  end

  def create
    @business_card = current_user.business_cards.build(business_card_params)

    respond_to do |format|
      if @business_card.save
        format.html { redirect_to @business_card, notice: 'Business card was successfully created.' }
        format.json { render :show, status: :created, location: @business_card }
      else
        format.html { render :new }
        format.json { render json: @business_card.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @business_card.update(business_card_params)
        format.html { redirect_to @business_card, notice: 'Business card was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_card }
      else
        format.html { render :edit }
        format.json { render json: @business_card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @business_card.destroy
    respond_to do |format|
      format.html { redirect_to user_profile_path(current_user), notice: 'Business card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_business_card
      @business_card = BusinessCard.find(params[:id])
    end

    def business_card_params
      params.require(:business_card).permit(:imdb, :twitter, :user_id)
    end
end
