class CreateRestaurants < ActiveRecord::Migration[8.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :address
      t.string :phone

      t.timestamps
    end
  end
end
