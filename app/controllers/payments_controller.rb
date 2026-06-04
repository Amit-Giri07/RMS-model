class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.find(params[:order_id])
    @payment = Payment.new
  end

  def create
    @order = Order.find(params[:order_id])

    @payment = @order.build_payment(
      payment_params
    )

    @payment.amount = @order.final_total
    @payment.status = :completed

    if @payment.save
      @order.update(status: :completed)

      redirect_to payment_path(@payment)
    else
      render :new,
              status: :unprocessable_entity
    end
  end

  private

  def payment_params
    params.require(:payment)
          .permit(:payment_method)
  end
end
