class Organization < ActiveRecord::Base
  has_many :car_models
  has_many :users
  validates :name, :public_name, presence: true
  validates :org_type, inclusion: {in: ["Show room", "Service", "Dealer"], message: "%{value} is not a valid organization type"}
  validates :pricing_policy, inclusion: {in: ["Flexible", "Fixed", "Prestige"], message: "%{value} is not a valid pricing policy type"}
end
