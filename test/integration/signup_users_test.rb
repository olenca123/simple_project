require 'test_helper'

class SignupUsersTest < ActionDispatch::IntegrationTest

  def setup
    @signup = signup(:olga)
  end

  test "unsuccessful edit" do
    log_in_as(@signup)
    get edit_signup_path(@signup)
    assert_template 'signups/edit'
    patch signup_path(@signup), params: { signup: { first_name:  "", last_name:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }

    assert_template 'signups/edit'
  end

  test "successful edit" do
    log_in_as(@signup)
    get edit_signup_path(@signup)
    assert_template 'signups/edit'
    first_name  = "Foo"
    last_name = "Bar"
    email = "foo@bar.com"
    patch signup_path(@signup), params: { signup: { first_name:  first_name,
                                              last_name: last_name
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @signup
    @signup.reload
    assert_equal first_name,  @signup.first_name
    assert_equal last_name,  @signup.last_name
    assert_equal email, @signup.email
  end

test "invalid signup information" do
    get person_path
    assert_no_difference 'Signup.count' do
      post signups_path, params: { signup: { first_name:  "",
      									last_name: "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'signups/new'
      assert_select 'div#<CSS id for error explanation>'
    assert_select 'div.<CSS class for field with error>'

  end
	
test "valid signup information" do
	get person_path
	assert_no_difference 'Signup.count', 1 do
	
	post signup_path, params: {signup: {first_name: "Example",
	                           last_name: "User",
	                           email: "exampl@user.com",
	                           password:              "password",
	                           password_confirmation: "password" }
 end
	follow_redirect!
	assert_template 'signup/show'
	assert is_logged_in?
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
    # Simulate a user clicking logout in a second window.
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", registration_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", signup_path(@signup), count: 0
  end

  test "login with remembering" do
    log_in_as(@signup, remember_me: '1')
    
  end

  test "login without remembering" do
    # Log in to set the cookie.
    log_in_as(@signup, remember_me: '1')
    # Log in again and verify that the cookie is deleted.
    log_in_as(@signup, remember_me: '0')
    assert_empty cookies['remember_token']
  end

  test "successful edit with friendly forwarding" do
    get edit_signup_path(@signup)
    log_in_as(@signup)
    assert_redirected_to edit_signup_url(@signup)
    first_name  = "Foo"
    last_name = "Bar"
    email = "foo@bar.com"
    patch signup_path(@signup), params: { signup: { first_name:  first_name,
                                              last_name: last_name
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @signup
    @signup.reload
    assert_equal first_name,  @signup.first_name
    assert_equal last_name,  @signup.last_name
    assert_equal email, @signup.email
  end

end
