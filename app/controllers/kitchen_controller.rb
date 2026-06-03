class KitchenController < ApplicationController
  def dashboard
    @orders = Order.where(
      status: [ :pending, :preparing ]
    )
  end

  def update
    @order = Order.find(params[:id])

    @order.update(
      status: params[:order][:status]
    )

  redirect_back fallback_location: orders_path
  end
end
