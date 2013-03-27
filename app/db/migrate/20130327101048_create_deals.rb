class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer :purchaser_id
      t.integer :receiver_id
      t.integer :points_for_distribution
      t.integer :purchaser_bonus_points

      t.timestamps
    end
    add_index :deals, :purchaser_id
    add_index :deals, :receiver_id
    add_index :deals, :created_at
  end
end
