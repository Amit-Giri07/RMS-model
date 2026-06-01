class DiningTable < ApplicationRecord
  belongs_to :restaurant

  enum :status, {
    available: 0,
    occupied: 1,
    reserved: 2
  }

  validates :table_number, presence: true
end
