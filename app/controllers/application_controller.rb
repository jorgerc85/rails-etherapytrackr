class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_therapist
    if session[:therapist_id]
      return Therapist.find(session[:therapist_id])
    else
      return nil
    end
  end

end
