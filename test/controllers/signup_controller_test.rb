require 'test_helper'

class SignupControllerTest < ActionDispatch::IntegrationTest

def setup
	@signup = signup(:olga)
	@other_signup = signup(:pavel)
end

  test "should redirect index when not logged in" do
    get signups_path
    assert_redirected_to person_url
  end


  test "should get new" do
    get login_new_url
    assert_response :success
  end

  test "should redirect edit when not logged in" do
  	log_in_as(@other_signup)
    get edit_signup_path(@signup)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
  	log_in_as(@other_signup)
    patch signup_path(@signup), params: { signup: { first_name: @signup.first_name,
    												last_name: @signup.last_name,
                                              email: @signup.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@other_signup)
    assert_not @other_signup.admin?
    patch signup_path(@other_signup), params: {signup: { password: FILL_IN,
                                            password_confirmation: FILL_IN,
                                            admin: FILL_IN } }
    assert_not @other_signup.FILL_IN.admin?
  end


end
