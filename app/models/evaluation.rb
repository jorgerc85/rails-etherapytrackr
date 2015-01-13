class Evaluation < ActiveRecord::Base
  validates :test_id, presence: true
  validates :patient_id, presence: true

  belongs_to :patient
  belongs_to :test
  has_many :evaluation_components
  has_many :components, through: :evaluation_components
end
