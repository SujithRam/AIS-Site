class RegistrationsController < ApplicationController
  before_action :logged_in_user, only: [:index, :destroy, :show]
  
  def new
    @registration = Registration.new
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
      #UserMailer.signup_confirmation(@user).deliver
      #log_in @user
      flash[:success] = "Your details has been registered."
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
  
  private
  def registration_params
      params.require(:registration).permit(:name, :email, :password,
                                   :password_confirmation, :fmlocation, :needpickup, :needaccom, :flightno, :landingtime) #change over here // added color option
  end
end
