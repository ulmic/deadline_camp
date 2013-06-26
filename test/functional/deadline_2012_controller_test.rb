require 'test_helper'

class Web::Deadline2012ControllerTest < ActionController::TestCase
  setup do
    @controller = Web::Deadline2012Controller.new
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
