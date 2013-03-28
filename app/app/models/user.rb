class User < ActiveRecord::Base
  attr_accessible :name # TODO read only
  has_many :purchases , dependent: :destroy
  has_many :outgoing_deals, foreign_key: "purchaser_id", class_name: "Deal", dependent: :destroy
  has_many :incoming_deals, foreign_key: "receiver_id", class_name: "Deal", dependent: :destroy

  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true


 def points
      total = 0
      incoming_deals.each do |d|
          if !d.used
            total += d.points_for_distribution
            d.used=true
            d.save
          end
      end

      outgoing_deals.each do |d|
         if d.used
            total += d.purchaser_bonus_points
            User.find(d.purchaser_id).outgoing_deals.delete(d)
            d.destroy
            d.save
        end
      end
    return total
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
