class CreateDiningTables < ActiveRecord::Migration[8.1]
  def change
    create_table :dining_tables do |t|
      t.integer :table_number
      t.integer :capacity
      t.integer :status
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
