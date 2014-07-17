class AddOrdersItemsTable < ActiveRecord::Migration
  def change
    # TODO
    create_table :orders_items do |t|
      t.integer :order_id
      t.integer :item_id

      t.timestamps
    end

    remove_column(:orders, :item_id)
  end
end
