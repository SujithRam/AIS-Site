class UtsavRegistrationsController < ApplicationController
  def new
    @utsav_registration = UtsavRegistration.new
  end
  
  def create
    @utsav_registration = UtsavRegistration.new(utsav_registration_params)    #userdetail_params is defined below
    if @utsav_registration.save
      #RegistrationMailer.signup_confirmation(@registration).deliver
      #log_in @user
      flash[:success] = "Your details have been registered. A confirmation email has been sent."
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  private
  def utsav_registration_params
      params.require(:utsav_registration).permit(:name, :email, :phone, :typeofpart, :otheractiv, :group, :grpdetails)
  end
end
