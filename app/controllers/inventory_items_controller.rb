class InventoryItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inventory_item, only: [ :show, :edit, :update, :destroy ]

  def index
    @inventory_items = InventoryItem.order(:name)
  end

  def show
  end

  def new
    @inventory_item = InventoryItem.new
  end

  def create
    @inventory_item = InventoryItem.new(inventory_item_params)

    if @inventory_item.save
      redirect_to inventory_items_path,
                  notice: "Inventory item created successfully"
    else
      render :new, status: :unprocessable_enttity
    end
  end

  def edit
  end

  def update
    if @inventory_item.update(inventory_item_params)
      redirect_to inventory_items_path,
                  notice: "Inventory update successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @inventory_item.destroy

    redirect_to inventory_items_path,
                notice: "Inventory item deleted"
  end

  private

  def inventory_item_params
    params.require(:inventory_item).permit(
      :name,
      :quantity,
      :unit,
      :minimum_stock,
      :cost_price
    )
  end
end
