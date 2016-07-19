class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show,:new]
  before_action :correct_user,   only: [:show]
  def new
    @user = User.new
  end
  
  def show
    @registrations = Registration.where('landingtime BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).all
    @user=User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)    #user_params is defined below
    if @user.save
      #UserMailer.signup_confirmation(@user).deliver
      log_in @user
      flash[:success] = "Welcome to the Student Management App!"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
  end
  
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
      if current_user?(@user)
        
      else
        flash[:danger] = "You are not a Authorized User!"
      end
  end
  
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :admin) #change over here // added color option
  end
end
