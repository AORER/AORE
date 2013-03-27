class Deal < ActiveRecord::Base
  attr_accessible :purchaser_bonus_points, :purchaser_id, :receiver_id, :points_for_distribution
  
  belongs_to :purchaser, class_name: "User"
  belongs_to :receiver, class_name: "User"
  default_scope order: 'deals.created_at DESC'

   def to_s
    " points_to_send, " + points_for_distribution.to_s + " your_bonus_points, " + purchaser_bonus_points.to_s + " , "
   end
end
