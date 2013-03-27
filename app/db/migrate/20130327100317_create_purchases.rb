class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.float :original_price
      t.float :price_after_discount
      t.integer :used_points
      t.integer :new_points

      t.timestamps
      end
      add_index :purchases, [:user_id, :created_at]
  end
end
