class RegDisablesController < ApplicationController
  before_action :logged_in_user, only: [:index, :remove_all_students, :remove_all_utsav_registrations, :remove_all_utsav_seats, :new, :show, :edit]
  before_action :login_admin, only:[:index, :remove_all_students, :remove_all_utsav_registrations, :remove_all_utsav_seats, :new, :show, :edit]
  
  def new
  end

  def index
    
  end

  def edit
    @reg_disable = RegDisable.find('1')
  end
  
  def update
    @reg_disable = RegDisable.find('1')
    if @reg_disable.update_attributes(reg_disable_params)
      flash[:success] = "Form Status updated"
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def show
  end
  
  def remove_all_students
    @registration = Registration.all
    @registration.each do |registration|
        registration.destroy
    end
    flash[:success] = "All Registrations has been deleted !!"
    redirect_to reg_disables_url
  end
  
  def remove_all_utsav_registrations
    @utsav_registration = UtsavRegistration.all
    @utsav_registration.each do |utsav|
        utsav.destroy
    end
    flash[:success] = "All Utsav Participant Registrations has been deleted !!"
    redirect_to reg_disables_url
  end
  
  def remove_all_utsav_seats
    @utsav_seat = UtsavSeat.all
    @utsav_seat.each do |utsav|
        utsav.destroy
    end
    flash[:success] = "All Utsav Seat Registrations has been deleted !!"
    redirect_to reg_disables_url
  end
  
  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "You should log in to use this page."
        redirect_to login_url
      end
  end
  
  def login_admin
      unless current_user.admin?
      redirect_to current_user_path
      flash[:danger] = "Administrator is only allowed to access this page." 
      end
  end
  
  private
  def reg_disable_params
      params.require(:reg_disable).permit(:studentreg, :utsavseatreg, :utsavpartreg) #change over here // added color option
  end
end
