class Therapist < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :profession, presence: true
  validates :email, presence:true, uniqueness: true,
                    :format => { :with => /\A.+@.+\..+{2}\z/,
                              :message => "Email address must be valid" }

  has_many :patient_therapists
  has_many :patients, through: :patient_therapists
end
