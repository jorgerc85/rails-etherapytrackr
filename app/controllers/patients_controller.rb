class PatientsController < ApplicationController
  before_action :is_logged_in?
  before_action :is_their_patient?, only: [:edit, :update]

  def index
    therapist = Therapist.find(session[:therapist_id])
    @patients = therapist.patients
  end

  def create
    therapist = Therapist.find(session[:therapist_id])
    patient = Patient.new(patients_params)
    if patient.save
      therapist.patients << patient
      redirect_to patients_path
    else
      set_error("Failed to register patient.")
      redirect_to new_patient_path
    end
  end

  def new
    @patient = Patient.new
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    patient = Patient.find(params[:id])
    patient.update(patients_params)
    if patient.save
      redirect_to patients_path
    else
      set_error("Failed to update patient.")
      redirect_to edit_patient_path(:id)
    end
  end

  private

  def patients_params
     params.require(:patient).permit(:first_name, :last_name, :birthday, :gender, :email)
  end

end
