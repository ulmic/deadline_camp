require 'test_helper'

class Web::WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get place" do
    get :place
    assert_response :success
  end
end
