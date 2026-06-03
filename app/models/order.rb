class Order < ApplicationRecord
  has_one :payment
  before_validation :generate_order_number

  private

  def generate_order_number
    self.order_number ||= "ORD-#{Time.current.to_i}"
  end

  belongs_to :user
  belongs_to :dining_table

  has_many :order_items, dependent: :destroy
  has_many :menu_items, through: :order_items

  enum :status, {
    pending: 0,
    preparing: 1,
    ready: 2,
    serverd: 3,
    completed: 4
  }

  validates :order_number, presence: true
end
