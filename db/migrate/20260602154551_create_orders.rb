class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.integer :status
      t.decimal :total_amount
      t.references :user, null: false, foreign_key: true
      t.references :dining_table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
