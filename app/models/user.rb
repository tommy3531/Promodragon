class User < ApplicationRecord

  has_many :business_cards, :dependent => :destroy
  before_create :create_business_card

  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_person_name

  has_many :notifications, foreign_key: :recipient_id
  has_many :services

  def create_business_card
    card = build_business_card(:imdb => "Imdb", :twitter => "twitter")
  end
end
