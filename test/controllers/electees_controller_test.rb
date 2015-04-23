require 'test_helper'

class ElecteesControllerTest < ActionController::TestCase
  setup do
    @electee = electees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:electees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create electee" do
    assert_difference('Electee.count') do
      post :create, electee: { user_id: @electee.user_id }
    end

    assert_redirected_to electee_path(assigns(:electee))
  end

  test "should show electee" do
    get :show, id: @electee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @electee
    assert_response :success
  end

  test "should update electee" do
    patch :update, id: @electee, electee: { user_id: @electee.user_id }
    assert_redirected_to electee_path(assigns(:electee))
  end

  test "should destroy electee" do
    assert_difference('Electee.count', -1) do
      delete :destroy, id: @electee
    end

    assert_redirected_to electees_path
  end
end
