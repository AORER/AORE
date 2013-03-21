class User < ActiveRecord::Base
  attr_accessible :name # TODO read only

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
end
