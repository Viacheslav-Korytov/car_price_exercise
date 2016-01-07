class User < ActiveRecord::Base
  belongs_to :organization
  before_create -> { self.auth_token = SecureRandom.hex }
  validates :name, :password, presence: true
  validates :organization, presence: true
  validates :name, uniqueness: true
end
