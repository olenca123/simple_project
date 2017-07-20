require 'test_helper'

class SignupsRegistrationTest < ActionDispatch::IntegrationTest
def setup
	@signup = signup(:olga)
end

  test "login with invalid information" do
    get registration_path
    assert_template 'sessions/new'
    post registration_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    get registration_path
    post registration_path, params: { session: { email:    @signup.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @signup
    follow_redirect!
    assert_template 'signups/show'
    assert_select "a[href=?]", registration_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", signup_path(@signup)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", registration_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", signup_path(@user), count: 0

  end
end
