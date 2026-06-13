class DiningTable < ApplicationRecord
  belongs_to :restaurant

  has_many :orders, dependent: :nullify

  enum :status, {
    available: 0,
    occupied: 1,
    reserved: 2
  }

  validates :table_number, presence: true, uniqueness: {
    scope: :restaurant_id
  }

  scope :available, -> { where(status: :available) }
end
