require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reportes"
Minitest::Reportes.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def is_logged_in?
  	!session[:signup_id].nil?  	
  end

# Log in as a particular user.
  def log_in_as(signup)
    session[:signup_id] = signup.id
  end
end

class ActionDispatch::IntegrationTest

  # Log in as a particular user.
  def log_in_as(signup, password: 'password', remember_me: '1')
    post registration_path, params: { session: { email: signup.email,
                                          password: password,
                                          remember_me: remember_me } }
  end
end
