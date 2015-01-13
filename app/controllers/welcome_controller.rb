class WelcomeController < ApplicationController
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

  def signup
    therapist = Therapist.new(params[:therapist])
    if therapist.save
      session[:therapist_id] = therapist.id
      redirect("/")
    else
      set_error("Failed to signup.")
      redirect("/")
    end
  end

  def logout
    session[:therapist_id] = nil
    redirect("/")
  end

end
