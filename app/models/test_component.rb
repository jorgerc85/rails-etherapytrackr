class TestComponent < ActiveRecord::Base
  validates :test_id, presence: true
  validates :component_id, presence: true

  belongs_to :test
  belongs_to :component
end
