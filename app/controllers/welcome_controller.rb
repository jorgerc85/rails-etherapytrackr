class WelcomeController < ApplicationController
  helper AuthHelper
  helper ErrorHandlingHelper

  def index

  end

  def login
    therapist = Therapist.find_by(email: params[:therapist][:email]).try(:authenticate, params[:therapist][:password])
    if therapist
      session[:therapist_id] = therapist.id
    else
      set_error("Email not found or password incorrect.")
    end
    redirect("/")
  end
end
