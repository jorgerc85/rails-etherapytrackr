class Test < ActiveRecord::Base
  validates :name, presence: true

  has_many :evaluations
end
