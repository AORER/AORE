class Purchase < ActiveRecord::Base
  attr_accessible :new_points, :original_price, :price_after_discount, :used_points, :user_id
  belongs_to :user
  validates :user_id, presence: true  

  default_scope order: 'purchases.created_at DESC'

  def to_s
    "original price: " + original_price.to_s + " ,after discount: " + price_after_discount.to_s + " ,used points: " + used_points.to_s + " ,new points: " + new_points.to_s + " , "
   end
end
