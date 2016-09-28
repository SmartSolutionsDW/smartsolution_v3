require 'test_helper'

class AdministratorLocalsControllerTest < ActionController::TestCase
  setup do
    @administrator_local = administrator_locals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administrator_locals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administrator_local" do
    assert_difference('AdministratorLocal.count') do
      post :create, administrator_local: { employee_id: @administrator_local.employee_id, estado: @administrator_local.estado, local_id: @administrator_local.local_id }
    end

    assert_redirected_to administrator_local_path(assigns(:administrator_local))
  end

  test "should show administrator_local" do
    get :show, id: @administrator_local
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administrator_local
    assert_response :success
  end

  test "should update administrator_local" do
    patch :update, id: @administrator_local, administrator_local: { employee_id: @administrator_local.employee_id, estado: @administrator_local.estado, local_id: @administrator_local.local_id }
    assert_redirected_to administrator_local_path(assigns(:administrator_local))
  end

  test "should destroy administrator_local" do
    assert_difference('AdministratorLocal.count', -1) do
      delete :destroy, id: @administrator_local
    end

    assert_redirected_to administrator_locals_path
  end
end
