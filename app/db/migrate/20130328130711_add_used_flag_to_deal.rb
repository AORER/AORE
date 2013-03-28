class AddUsedFlagToDeal < ActiveRecord::Migration
  def change
  	add_column :deals, :used, :boolean
  end
end
