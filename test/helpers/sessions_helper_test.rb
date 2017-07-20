require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @signup = signups(:olga)
    remember(@signup)
  end

  test "current_signup returns right user when session is nil" do
    assert_equal @signup, current_signup
    assert is_logged_in?
  end

  test "current_signup returns nil when remember digest is wrong" do
    @signup.update_attribute(:remember_digest, Signup.digest(Signup.new_token))
    assert_nil current_signup
  end
end