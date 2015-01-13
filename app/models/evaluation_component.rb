class EvaluationComponent < ActiveRecord::Base
  validates :value, presence: true
  validates :evaluation_id, presence: true
  validates :component_id, presence: true

  belongs_to :evaluation
  belongs_to :component
end
