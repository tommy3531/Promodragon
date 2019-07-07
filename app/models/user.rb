class User < ApplicationRecord

  has_one :profile, :dependent => :destroy

  has_many :business_cards, :dependent => :destroy

  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_person_name

  has_many :notifications, foreign_key: :recipient_id
  has_many :services

  has_one_attached :avatar
  has_many :posts
  has_many :comments
end
