class RegistrationsController < ApplicationController
  before_action :logged_in_user, only: [:index, :destroy, :show]
  before_action :login_admin, only:[:index]
  
  def new
    @registration = Registration.new
    @data = RegDisable.find('1')
  end
  
  def edit
    @registration = Registration.find(params[:id])
  end
  
  def update
    @registration = Registration.find(params[:id])
    if @registration.update_attributes(registration_params)
      flash[:success] = "Profile updated"
      redirect_to registration_path
    else
      render 'edit'
    end
  end
  
  def index
    if current_user.admin?
      @registrations = Registration.paginate(page: params[:page]) ## displays all details 
    else
      @registrations = Registration.where("landingtime >= ?", Time.zone.now.beginning_of_day).paginate(page: params[:page]) ## displays details based on todays date
    end
  end
  
  def destroy
    Registration.find(params[:id]).destroy
    flash[:success] = "Registration deleted"
    redirect_to registrations_path
  end
  
  def create
    @registration = Registration.new(registration_params)    #userdetail_params is defined below
    params[:registration][:landingtime] = params[:registration][:landingtime].to_datetime
    if @registration.save
      RegistrationMailer.signup_confirmation(@registration).deliver
      #log_in @user
      flash[:success] = "Your details have been registered. A confirmation email has been sent."
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def show
    @registration = Registration.find(params[:id])
  end
  
  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Not accessible to students. Admin Please log in"
        redirect_to login_url
      end
  end
  
  def admin_user
      redirect_to(registrations_path) unless current_user.admin?
  end
  
  def login_admin
      unless User.exists?(email: session[:email].downcase)
      redirect_to root_url
      flash[:danger] = "Administrator is only allowed to access registrations index page." 
      end
  end
  
  private
  def registration_params
      params.require(:registration).permit(:name, :email, :password,
                                   :password_confirmation, :fmlocation, :needpickup, :needaccom, :flightno, :landingtime) #change over here // added color option
  end
end
