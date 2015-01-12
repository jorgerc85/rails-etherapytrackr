module ErrorHandlingHelper

  def display_error
    error = session[:error]
    session[:error] = nil
    error
  end

  def set_error(msg)
    session[:error] = msg
  end

end
