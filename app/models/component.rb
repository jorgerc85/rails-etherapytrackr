class Component < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  has_many :test_components
  has_many :tests, through: :test_components
  has_many :evaluation_components
  has_many :evaluations, through: :evaluation_components

end
