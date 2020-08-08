class Plant < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_plant,
    against: [ :name, :species, :category, :price, :address, :description ],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :species, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :description, presence: true
end
