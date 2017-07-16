require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get project" do
    get static_pages_project_url
    assert_response :success
    assert_select "title", "Project | Project"

  end

  test "should get task" do
    get static_pages_task_url
    assert_response :success
    assert_select "title", "Task | Project"
  end

  test "should get user" do
    get static_pages_user_url
    assert_response :success
    assert_select "title", "User | Project"
  end

  test "should get main" do
    get static_pages_main_url
    assert_response :success
    assert_select "title", "Main | Project"
  end

end
