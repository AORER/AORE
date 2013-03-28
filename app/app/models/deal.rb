include ActionView::Helpers::TextHelper

class Deal < ActiveRecord::Base
  attr_accessible :purchaser_bonus_points, :purchaser_id, :receiver_id, :points_for_distribution, :used
  belongs_to :purchaser, class_name: "User"
  belongs_to :receiver, class_name: "User"
  default_scope order: 'deals.created_at DESC'

   def to_s_sender
    "send " + pluralize(points_for_distribution, 'point') + " to a friend, and get extra " + pluralize(purchaser_bonus_points, 'point') + "."
   end

   def to_s_receiver
    "got " + pluralize(points_for_distribution, 'point') + " from " + User.find(purchaser_id).name
   end
end
