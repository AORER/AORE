class AddPointsToDeal3 < ActiveRecord::Migration
  def change
  	add_column :deals, :points_for_distribution, :integer
  end
end
