class PatientTherapist < ActiveRecord::Base
  belongs_to :patient
  belongs_to :therapist
end
