module AccessHelper
  def current_user
    @current_user = @current_user || User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
  def user_admin?
    current_user.admin == true
  end
end
