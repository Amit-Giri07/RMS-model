class KitchenController < ApplicationController
  def dashboard
    @orders = Order.where(
      status: [ :pending, :preparing ]
    )
  end
end
