class UtsavRegistrationsController < ApplicationController
  before_action :logged_in_user, only: [:index, :destroy, :show, :edit]
  before_action :login_admin, only:[:index, :destroy]
  
  def new
    @utsav_registration = UtsavRegistration.new
  end
  
  def create
    params[:utsav_registration][:typeofpart] = params[:utsav_registration][:typeofpart].delete_if{ |x| x.empty? } #deletes first space from array created by multi select and that space is created by rails by default.
    @utsav_registration = UtsavRegistration.new(utsav_registration_params)    #userdetail_params is defined below
    if @utsav_registration.save
      UtsavRegistrationMailer.details_confirmation(@utsav_registration).deliver
      flash[:success] = "Your details have been registered. A confirmation email has been sent."
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def destroy
    UtsavRegistration.find(params[:id]).destroy
    flash[:success] = "Registration deleted"
    redirect_to utsav_registrations_path
  end
  
  def show
    @utsav_registration = UtsavRegistration.find(params[:id])
  end
  
  def index
    @utsav_registrations = UtsavRegistration.paginate(page: params[:page])
  end
  
  def edit
    @utsav_registration = UtsavRegistration.find(params[:id])
  end
  
  def update
    @utsav_registration = UtsavRegistration.find(params[:id])
    if @utsav_registration.update_attributes(utsav_registration_params)
      flash[:success] = "Details updated"
      redirect_to utsav_registration_path
    else
      render 'edit'
    end
  end
  
  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Not accessible to students. Admin Please log in"
        redirect_to login_url
      end
  end
  
  def login_admin
      unless User.exists?(email: session[:email].downcase)
      redirect_to root_url
      flash[:danger] = "Administrator is only allowed to access registrations index page." 
      end
  end
  
  private
  def utsav_registration_params
      params.require(:utsav_registration).permit(:name, :email, :phone, :otheractiv, :group, :grpdetails, :typeofpart => [])
  end
end
