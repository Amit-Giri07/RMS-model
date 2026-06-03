class Payment < ApplicationRecord
  belongs_to :order

  enum :payment_method, {
    cash: 0,
    card: 1,
    wallet: 2
  }

  enum :status, {
    pending: 0,
    completed: 1,
    failed: 2
  }
end
