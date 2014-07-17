class AddSessionsTable < ActiveRecord::Migration
  def change
    # TODO
    create_table :sessions do |t|
      t.integer :user_id
      t.string :session

      t.timestamps
    end
  end
end
