class Purchase < ActiveRecord::Base
  attr_accessible :new_points, :original_price, :price_after_discount, :used_points, :user_id
  belongs_to :user
  validates :user_id, presence: true  

  default_scope order: 'purchases.created_at DESC'

  def to_s
    "original_price: " + original_price.to_s + " ,price_after_discount: " + price_after_discount.to_s + " ,used_points: " + used_points.to_s + " ,new_points: " + new_points.to_s + " , "
   end
end
