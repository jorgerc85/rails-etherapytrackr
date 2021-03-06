class WelcomeController < ApplicationController

  def index

  end

  def login
    therapist = Therapist.find_by(email: params[:therapist][:email]).try(:authenticate, params[:therapist][:password])
    if therapist
      session[:therapist_id] = therapist.id
    else
      set_error("Email not found or password incorrect.")
    end
    redirect_to root_path
  end

  def signup
    therapist = Therapist.new(therapist_params)
    if therapist.save
      session[:therapist_id] = therapist.id
      redirect_to root_path
    else
      set_error("Failed to signup.")
      redirect_to root_path
    end
  end

  def logout
    session[:therapist_id] = nil
    redirect_to root_path
  end

  def therapist_params
     params.require(:therapist).permit(:name, :profession, :email, :password)
  end

end
