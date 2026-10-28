class RenameCarItemsToCartItems < ActiveRecord::Migration[8.0]
  def change
    rename_table :car_items, :cart_items
  end
end