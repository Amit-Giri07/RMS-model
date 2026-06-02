class Order < ApplicationRecord
  belongs_to :user
  belongs_to :dining_table
end
