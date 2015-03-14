class Test < ActiveRecord::Base
  validates :name, presence: true

  has_many :evaluations

  def components
    self.test_params.split(" ")
  end
end
