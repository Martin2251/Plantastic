class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  include PgSearch::Model
  pg_search_scope :search_by_plant_name,
    against: [ :beginning_date, :end_date ],
    associated_against: {
      plant: [ :name, :species, :description]
    },
    using: {
      tsearch: { prefix: true }
    }

  has_many :reviews, dependent: :destroy

end
