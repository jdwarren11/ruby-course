class CreateTables < ActiveRecord::Migration
  def change
    # TODO
    create_table :users do |t|
      t.string :username
      t.string :password
      t.boolean :admin

      t.timestamps
    end

    create_table :items do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end

    create_table :orders do |t|
      t.integer :user_id
      t.integer :item_id

      t.timestamps
    end
  end
end
