module AuthHelper
  def current_therapist
    if session[:therapist_id]
      return Therapist.find(session[:therapist_id])
    else
      return nil
    end
  end
end
