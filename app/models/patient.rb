class Patient < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :gender, presence: true
  validates :email, uniqueness: true

  has_many :patient_therapists
  has_many :therapists, through: :patient_therapists
  has_many :evaluations

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def age
    years = Time.now.year - self.birthday.year
    months = Time.now.month - self.birthday.month
    if months < 0
      years -= 1
      months += 12
    end
    "#{years} years and #{months} months"
  end

  def calculate!(eval_params)
    test_name = eval_params.delete('test_name')
    calculation_params = eval_params.map { |k,v| v.to_f }
    self.send(test_name.to_sym, calculation_params)
  end

  def calculate_bmi(calculation_params)
    (calculation_params[0] / (calculation_params[1] ** 2).to_f * 10000)
  end

end
