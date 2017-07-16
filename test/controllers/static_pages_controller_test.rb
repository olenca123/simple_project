require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get project" do
    get static_pages_project_url
    assert_response :success
  end

  test "should get task" do
    get static_pages_task_url
    assert_response :success
  end

  test "should get user" do
    get static_pages_user_url
    assert_response :success
  end

end
