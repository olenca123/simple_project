require 'test_helper'

class SignupsIndexTest < ActionDispatch::IntegrationTest
  def setup
    @signup = signup(:olga)
  end

  test "index including pagination" do
    log_in_as(@signup)
    get signup_path
    assert_template 'signup/index'
    assert_select 'div.pagination'
    Signup.paginate(page: 1).each do |signup|
      assert_select 'a[href=?]', signup_path(signup), text: signup.first_name
    end
  end
end
