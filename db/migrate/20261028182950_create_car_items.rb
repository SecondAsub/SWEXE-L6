class CreateCarItems < ActiveRecord::Migration[8.1]
  def change
    create_table :car_items do |t|
      t.integer :qty
      t.references :product, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
