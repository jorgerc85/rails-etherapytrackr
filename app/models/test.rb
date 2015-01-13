class Test < ActiveRecord::Base
  validates :name, presence: true
  validates :therapist_id, presence: true

  belongs_to :therapist
  has_many :evaluations
  has_many :test_components
  has_many :components, through: :test_components
end
