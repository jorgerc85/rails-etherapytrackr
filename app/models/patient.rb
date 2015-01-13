class Patient < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :gender, presence: true
  validates :weight, presence: true
  validates :height, presence: true
  validates :email, uniqueness: true

  has_many :patient_therapists
  has_many :therapists, through: :patient_therapists
  has_many :evaluations

  def self.calculate_bmi
    (self.weight / (self.height ** 2).to_f * 10000)
  end

end
