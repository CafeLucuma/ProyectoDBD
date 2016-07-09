require 'test_helper'

class TakeHoursControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get show2" do
    get :show2
    assert_response :success
  end

  test "should get show3" do
    get :show3
    assert_response :success
  end

end
