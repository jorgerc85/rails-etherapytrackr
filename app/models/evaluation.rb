class Evaluation < ActiveRecord::Base
  validates :score, presence: true
  validates :test_id, presence: true
  validates :patient_id, presence: true

  belongs_to :patient
  belongs_to :test
end
