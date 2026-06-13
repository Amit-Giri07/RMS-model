class OrderItemsController < ApplicationController
  def create
    quantity = params[:quantity].to_i

    if quantity <=0
      redirect_back(
        fallback_location: root_path,
        alert: "Quantity must be greater than zero"
        )
        return
    end

    order = Order.find(params[:order_id])
    menu_item = MenuItem.find(params[:menu_item_id])

  order.order_items.create!(
    menu_item: menu_item,
    quantity: params[:quantity],
    price: menu_item.price
  )

  redirect_to order
  end
end
