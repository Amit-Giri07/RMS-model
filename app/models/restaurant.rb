class Restaurant < ApplicationRecord
  validates :name, presence: true

  has_many :dining_tables, dependent: :destroy
end
