class UtsavSeatsController < ApplicationController
  before_action :logged_in_user, only: [:index, :destroy, :show, :edit]
  before_action :login_admin, only:[:index, :destroy]
  
  def index
    #@utsav_seats = UtsavSeat.paginate(page: params[:page])
    if params[:search]
      @utsav_seats = UtsavSeat.search(params[:search]).order("created_at DESC").paginate(page: params[:page])
    else
      @utsav_seats = UtsavSeat.paginate(page: params[:page])
    end
  end

  def new
    data = 0
    UtsavSeat.all.each do |com|
    data = data + com.people
    end
    data = 300 - data
    @utsav_seat = UtsavSeat.new
    @utsav_seat.data = data
  end
  
  def create
    arraylength = 0
    utsav_seat_array = params[:utsav_seat][:grpdetails].split(',')
    arraylength = utsav_seat_array.length
    if arraylength < 4
      arraylength = arraylength + 1
      params[:utsav_seat][:people] = arraylength
      params[:utsav_seat][:confirmation] = generate_code(5)
      @utsav_seat = UtsavSeat.new(utsav_seat_params) 
      if @utsav_seat.save
        if @utsav_seat.member.eql? "Yes"
        UtsavSeatMailer.indian_details_confirmation(@utsav_seat).deliver
        else
        UtsavSeatMailer.details_confirmation(@utsav_seat).deliver
        end
        flash[:success] = "Your details have been registered. A confirmation email has been sent."
        redirect_to root_url
      else
        render 'new'
      end
    else
      flash[:danger] = "Maximum 3 people allowed to Register on  a single person name."
      redirect_to new_utsav_seat_path
    end
  end

  def show
    @utsav_seat = UtsavSeat.find(params[:id])
  end
  
  def edit
  end
  
  def destroy
    UtsavSeat.find(params[:id]).destroy
    flash[:success] = "Registration deleted"
    redirect_to utsav_seats_path
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
  def utsav_seat_params
      params.require(:utsav_seat).permit(:name, :email, :phone, :group, :grpdetails, :people, :member, :confirmation)
  end
  
  def generate_code(number)
    charset = Array('A'..'Z') + Array(1..9)
    Array.new(number) { charset.sample }.join
  end
end
