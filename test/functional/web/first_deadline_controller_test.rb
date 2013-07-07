require 'test_helper'

class Web::FirstDeadlineControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get news" do
    get :news
    assert_response :success
  end
end
