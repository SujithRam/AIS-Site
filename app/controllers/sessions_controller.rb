class SessionsController < ApplicationController
  def new
  end
  
  def create
    if Registration.exists?(email: params[:session][:email].downcase)
      registration = Registration.find_by(email: params[:session][:email].downcase)
      if registration && registration.authenticate(params[:session][:password])
        log_in_student(registration)
        redirect_back_or edit_registration_path(current_user)
      else
        flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
        render 'new'
      end
    else  
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user #function defined in session_helper.rb
        redirect_back_or user
      else
        flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
        render 'new'
      end
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
