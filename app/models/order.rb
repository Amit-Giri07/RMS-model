class Order < ApplicationRecord
  belongs_to :user
  belongs_to :dining_table

  has_many :order_items, dependent: :destroy
  has_many :menu_items, through: :order_items

  has_one :payment

  enum :status, {
    pending: 0,
    preparing: 1,
    ready: 2,
    served: 3,
    completed: 4
  }

  before_validation :generate_order_number
  after_create :mark_table_occupied
  after_update :free_table_if_completed

  validates :order_number, presence: true

  def calculate_total
    order_items.sum("quantity * price")
  end

  def tax_amount
    calculate_total * 0.13
  end

  def final_total
    calculate_total + tax_amount
  end

  private

  def generate_order_number
    self.order_number ||= "ORD-#{Time.current.to_i}"
  end

  def mark_table_occupied
    dining_table.update(status: :occupied)
  end

  def free_table_if_completed
    if saved_change_to_status? && completed?
      dining_table.update(status: :available)
    end
  end

  def set_default_status
    self.status ||= :pending
  end
end
