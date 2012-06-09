require 'test_helper'

class OrganizerSessionsControllerTest < ActionController::TestCase
  setup do
    @organizer_session = organizer_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizer_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organizer_session" do
    assert_difference('OrganizerSession.count') do
      post :create, organizer_session: @organizer_session.attributes
    end

    assert_redirected_to organizer_session_path(assigns(:organizer_session))
  end

  test "should show organizer_session" do
    get :show, id: @organizer_session.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organizer_session.to_param
    assert_response :success
  end

  test "should update organizer_session" do
    put :update, id: @organizer_session.to_param, organizer_session: @organizer_session.attributes
    assert_redirected_to organizer_session_path(assigns(:organizer_session))
  end

  test "should destroy organizer_session" do
    assert_difference('OrganizerSession.count', -1) do
      delete :destroy, id: @organizer_session.to_param
    end

    assert_redirected_to organizer_sessions_path
  end
end
