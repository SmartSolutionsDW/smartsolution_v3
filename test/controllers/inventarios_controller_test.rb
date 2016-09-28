require 'test_helper'

class InventariosControllerTest < ActionController::TestCase
  setup do
    @inventario = inventarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventario" do
    assert_difference('Inventario.count') do
      post :create, inventario: { cant: @inventario.cant, entrada_salida: @inventario.entrada_salida, local_id: @inventario.local_id, precio_compra: @inventario.precio_compra, precio_venta: @inventario.precio_venta, producto_id: @inventario.producto_id }
    end

    assert_redirected_to inventario_path(assigns(:inventario))
  end

  test "should show inventario" do
    get :show, id: @inventario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventario
    assert_response :success
  end

  test "should update inventario" do
    patch :update, id: @inventario, inventario: { cant: @inventario.cant, entrada_salida: @inventario.entrada_salida, local_id: @inventario.local_id, precio_compra: @inventario.precio_compra, precio_venta: @inventario.precio_venta, producto_id: @inventario.producto_id }
    assert_redirected_to inventario_path(assigns(:inventario))
  end

  test "should destroy inventario" do
    assert_difference('Inventario.count', -1) do
      delete :destroy, id: @inventario
    end

    assert_redirected_to inventarios_path
  end
end
