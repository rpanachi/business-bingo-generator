require 'test_helper'

class TermosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:termos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create termo" do
    assert_difference('Termo.count') do
      post :create, :termo => { }
    end

    assert_redirected_to termo_path(assigns(:termo))
  end

  test "should show termo" do
    get :show, :id => termos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => termos(:one).to_param
    assert_response :success
  end

  test "should update termo" do
    put :update, :id => termos(:one).to_param, :termo => { }
    assert_redirected_to termo_path(assigns(:termo))
  end

  test "should destroy termo" do
    assert_difference('Termo.count', -1) do
      delete :destroy, :id => termos(:one).to_param
    end

    assert_redirected_to termos_path
  end
end
