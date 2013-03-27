class AddPointsToDeal2 < ActiveRecord::Migration
  def change
  	  	add_column :deals, :points_for_distribution, :integer
  	remove_column :deals, :pointsForDistribution
  	remove_column :deals, :repoints_for_distribution
  end
end
