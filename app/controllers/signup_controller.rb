class SignupController < ApplicationController
  before_action :logged_in_signup, only: [:index, :edit, :update, :destroy]
  before_action :correct_signup,   only: [:edit, :update]
  before_action :admin_signup,     only: :destroy

def index
  @signup = Signup.paginate(page: params[:page])
end

  def show
  	@signup =Signup.find(params[:id])
  end

  def new
  	@signup = Signup.new
  end

  def create
  	@signup = Signup.new(signup_params)
  	if @signup.save
      log_in @signup
      flash[:success] = "Project App"
      redirect_to @signup
  	else
  		render 'new'
  	end  	
  end

  def edit
    @signup = Signup.find(params[:id])
  end

  def update
    @signup = Signup.find(params[:id])
    if @signup.update_attributes(signup_params)
      flash[:success] = "Profile updated"
      redirect_to @signup
    else
      render 'edit'
    end

    def destroy
    Signup.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to signup_url
  end


  end

  private
  def signup_params
  	params.require(:signup).permit(:first_name, :last_name,
  	 :email, :password, :password_confirmation)
  end

# Confirms a logged-in user.
    def logged_in_signup
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to registration_url
      end
    end

    # Confirms the correct user.
    def correct_signup
      @signup = Signup.find(params[:id])
      redirect_to(root_url) unless current_signup?(@signup)
    end

    def admin_signup
      redirect_to(root_url) unless current_signup.admin?
    end

end
