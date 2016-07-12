require 'test_helper'

class MyHoursControllerTest < ActionController::TestCase
  test "should get mishoras" do
    get :mishoras
    assert_response :success
  end

  test "should get mishoras2" do
    get :mishoras2
    assert_response :success
  end

end
