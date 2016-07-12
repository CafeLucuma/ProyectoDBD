require 'test_helper'

class AdministrationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get hours" do
    get :hours
    assert_response :success
  end

  test "should get selec_doctor" do
    get :selec_doctor
    assert_response :success
  end

  test "should get block" do
    get :block
    assert_response :success
  end

  test "should get add_block" do
    get :add_block
    assert_response :success
  end

end
