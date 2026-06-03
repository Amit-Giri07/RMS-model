class OrderItemsController < ApplicationController
  def create
    menu_item = MenuItem.find(params[:menu_item_id])

  OrderItem.create!(
    order_id: params[:order_id],
    menu_item: menu_item,
    quantity: params[:quantity],
    price: menu_item.price
  )

  redirect_back fallback_location: root_path
  end
end
