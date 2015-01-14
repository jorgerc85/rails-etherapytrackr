class PatientsController < ApplicationController

  def index
    therapist = Therapist.find(session[:therapist_id])
    @patients = Patient.all
  end

  def create
    therapist = Therapist.find(session[:therapist_id])
    patient = therapist.patients.new(patients_params)
    if patient.save
      redirect_to root_path
    else
      set_error("Failed to register patient.")
      redirect_to root_path
    end
  end

  def new

  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    patient = Patient.find(params[:id])
    patient.update(patients_params)
    if patient.save
      redirect_to root_path
    else
      set_error("Failed to update patient.")
      redirect_to root_path
    end
  end

  private

  def patients_params
     params.require(:patient).permit(:first_name, :last_name, :birthday, :gender, :height, :weight, :email)
  end

end
