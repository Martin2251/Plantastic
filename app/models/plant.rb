class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos

  validates :name, presence: true
  validates :type, presence: true
  validates :species, presence: true
  validates :photos, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :description, presence: true
end
