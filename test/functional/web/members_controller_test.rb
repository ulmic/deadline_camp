require 'test_helper'

class Web::MembersControllerTest < ActionController::TestCase
  setup do
    @member = create :member, :with_full_profile
  end

  test "should sign_in member" do
    attributes = { email: @member.email, password: @member.password }
    post :login, attributes
    #FIXME
    assert_response :redirect
  end

  test "should sign_out member" do
    post :logout
    assert_equal nil, session[:member_id]
  end

  test "should not sign in member" do
    attributes = attributes_for :member
    post :login, attributes
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    attrs = attributes_for(:member)

    post :create, member: attrs
    assert_response :redirect

    member = Member.find_by_email attrs[:email]
    assert_not_nil member
  end

end
