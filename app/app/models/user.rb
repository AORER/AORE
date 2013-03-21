class User < ActiveRecord::Base
  attr_accessible :name # TODO read only

  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
