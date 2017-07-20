module SessionsHelper
	def log_in(signup)
		session[:signup_id] = signup.id
	end

	def remember(signup)
		signup.remember
		cookies.permanent.signed[:signup_id] = signup_id
		cookies.permanent[:remember_token] = signup.remember_token
		
	end

	def current_signup?(signup)
		signup == current_signup		
	end

	def current_signup
		 if (signup_id = session[:signup_id])
      @current_signup ||= Signup.find_by(id: signup_id)
      elsif (signup_id = cookies.signed[:signup_id])
      	
      signup = Signup.find_by(id: signup_id)
      if signup && signup.authenticated?(cookies[:remember_token])
        log_in signup
        @current_signup = signup
		@current_signup ||= Signup.find_by(id: session[:signup_id])		
	end  
    end
end

	def logged_in?
		!current_signup.nil?
	end

	def forget(signup)
		#signup.forget
		cookies.delete(:signup_id)
		cookies.delete(:remember_token)
	end

	def log_out
		forget(current_signup)
		session.delets(:signup_id)
		@current_signup = nil
	end
	# Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end

