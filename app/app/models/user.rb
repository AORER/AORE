class User < ActiveRecord::Base
  attr_accessible :name # TODO read only
  has_many :purchases , dependent: :destroy
  has_many :outgoing_deals, foreign_key: "purchaser_id", class_name: "Deal", dependent: :destroy
  has_many :incoming_deals, through: :outgoing_deals, source: :receiver

  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
