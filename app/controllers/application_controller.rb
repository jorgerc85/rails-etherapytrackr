class ApplicationController < ActionController::Base
  include ApplicationHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def is_logged_in?
      unless session[:therapist_id]
        set_error("You must login to continue.")
        redirect_to root_path
      end
    end

    def is_their_patient?
      patient = Patient.find(params[:id])
      therapist = Therapist.find(session[:therapist_id])
      unless patient.therapists.include?(therapist)
        set_error("You are not authorized to do that.")
        redirect_to patients_path
      end
    end

end
