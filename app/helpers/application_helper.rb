module ApplicationHelper

  def display_error
    error = session[:error]
    session[:error] = nil
    error
  end

  def set_error(msg)
    session[:error] = msg
  end

  def current_therapist
    if session[:therapist_id]
      return Therapist.find(session[:therapist_id])
    else
      return nil
    end
  end

end
