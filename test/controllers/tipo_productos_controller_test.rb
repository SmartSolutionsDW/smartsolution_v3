require 'test_helper'

class TipoProductosControllerTest < ActionController::TestCase
  setup do
    @tipo_producto = tipo_productos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_productos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_producto" do
    assert_difference('TipoProducto.count') do
      post :create, tipo_producto: { Co_TipoProducto: @tipo_producto.Co_TipoProducto, No_CoTipoProducto: @tipo_producto.No_CoTipoProducto }
    end

    assert_redirected_to tipo_producto_path(assigns(:tipo_producto))
  end

  test "should show tipo_producto" do
    get :show, id: @tipo_producto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_producto
    assert_response :success
  end

  test "should update tipo_producto" do
    patch :update, id: @tipo_producto, tipo_producto: { Co_TipoProducto: @tipo_producto.Co_TipoProducto, No_CoTipoProducto: @tipo_producto.No_CoTipoProducto }
    assert_redirected_to tipo_producto_path(assigns(:tipo_producto))
  end

  test "should destroy tipo_producto" do
    assert_difference('TipoProducto.count', -1) do
      delete :destroy, id: @tipo_producto
    end

    assert_redirected_to tipo_productos_path
  end
end
