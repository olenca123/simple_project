require 'test_helper'

class SignupTest < ActiveSupport::TestCase
	def setup
		@signup = Signup.new(first_name: "Example", last_name: "User", email: "user@example.com",
			    password: "foobar", password_confirmation: "foobar")
	end

test "email validation should accept valid addresses" do
    valid_addresses = %w[signup@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @signupi.email = valid_address
      assert @signup.valid?, "#{valid_address.inspect} should be valid"
    end
 test "email validation should reject invalid addresses" do
    invalid_addresses = %w[signup@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @signup.email = invalid_address
      assert_not @signup.valid?, "#{invalid_address.inspect} should be invalid"
    end
  test "should be valid" do 
	assert @signup.valid?	
  end
  test "first_name should be present" do 
	@signup.first_name = ""
	assert_not @signup.valid?
  end
   test "last_name should be present" do 
	@signup.last_name = ""
	assert_not @signup.valid?
  end
  test "email should be present" do
  	@signup.email = "    "
  	assert_not @signup.valid?
  end
  test "first_name should not be long" do
  	@signup.first_name = "a" * 51
  	assert_not @signup.valid?
  end
  test "last_name should not be long" do
  	@signup.last_name = "a" * 51
  	assert_not @signup.valid?
  end
  test "email should not be too long" do
  	@signup.email = "a" * 256
  	assert_not @signup.valid?
  end
  test "password should have a minimum length" do
  	@signup.password = @signup.password_confirmation = "a" * 5
  	assert_not @signup.valid?
  end
end



  .
  
  end
end