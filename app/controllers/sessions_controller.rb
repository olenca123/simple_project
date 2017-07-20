class SessionsController < ApplicationController
  def new
  end

  def create
  	signup = Signup.find_by(email: params[:session][:email])
  	if signup && signup.authenticate(params[:session][:password])
  		log_in signup
      params[:session][:remember_me] == '1' ? remember(signup) : forget(signup)
      redirect_back_or signup
  	else
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
    
    end
  end
  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end
end
