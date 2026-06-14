class CreateInventoryItems < ActiveRecord::Migration[8.1]
  def change
    create_table :inventory_items do |t|
      t.string :name
      t.decimal :quantity
      t.string :unit
      t.decimal :minimum_stock
      t.decimal :cost_price

      t.timestamps
    end
  end
end
