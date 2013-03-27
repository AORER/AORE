class AddPointsToDeal4 < ActiveRecord::Migration
  def change
  	remove_column :deals, :pointsForDistribution
  	remove_column :deals, :repoints_for_distribution
  end
end
