class PatientsController < ApplicationController

  def index
  end

  def create
    therapist = Therapist.find(session[:therapist_id])
    patient = therapist.patients.new(patients_params)
    if patient.save
      redirect_to "/"
    else
      set_error("Failed to register patient.")
      redirect_to "/"
    end
  end

  def new
  end

  # def show
  # end

  def edit

  end

  def update
  end

  def patients_params
     params.require(:patient).permit(:first_name, :last_name, :birthday, :gender, :height, :weight, :email)
  end

end
