class CarModel < ActiveRecord::Base
  belongs_to :organization
  has_many :model_types
  validates :name, :model_slug, presence: true
  validates :organization, presence: true
  
  def to_param
	model_slug
  end
end
