class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params)

    if @order.save
      redirect_to @order
    else
      render :new,
              status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order)
          .permit(:dining_table_id)
  end
end
