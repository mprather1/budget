class AccessController < ApplicationController

 
  def index
    @username = params[:username]
  end

  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      session[:first_name] = authorized_user.first_name
      session[:last_name] = authorized_user.last_name
      flash[:notice] = "You are now logged in as #{session[:first_name]} #{session[:last_name]}"
      redirect_to users_path
    else
      flash[:notice] = "Invalid username/password combination"
      redirect_to access_login_path
    end

  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to access_login_path
  end
end
