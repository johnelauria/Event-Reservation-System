require 'test_helper'

class AdminSessionsControllerTest < ActionController::TestCase
  setup do
    @admin_session = admin_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_session" do
    assert_difference('AdminSession.count') do
      post :create, admin_session: @admin_session.attributes
    end

    assert_redirected_to admin_session_path(assigns(:admin_session))
  end

  test "should show admin_session" do
    get :show, id: @admin_session.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_session.to_param
    assert_response :success
  end

  test "should update admin_session" do
    put :update, id: @admin_session.to_param, admin_session: @admin_session.attributes
    assert_redirected_to admin_session_path(assigns(:admin_session))
  end

  test "should destroy admin_session" do
    assert_difference('AdminSession.count', -1) do
      delete :destroy, id: @admin_session.to_param
    end

    assert_redirected_to admin_sessions_path
  end
end
