require 'test_helper'

class PiezasControllerTest < ActionController::TestCase
  setup do
    @pieza = piezas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:piezas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pieza" do
    assert_difference('Pieza.count') do
      post :create, pieza: { alto: @pieza.alto, ancho: @pieza.ancho, descripcion: @pieza.descripcion, nombre: @pieza.nombre, tipo: @pieza.tipo }
    end

    assert_redirected_to pieza_path(assigns(:pieza))
  end

  test "should show pieza" do
    get :show, id: @pieza
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pieza
    assert_response :success
  end

  test "should update pieza" do
    patch :update, id: @pieza, pieza: { alto: @pieza.alto, ancho: @pieza.ancho, descripcion: @pieza.descripcion, nombre: @pieza.nombre, tipo: @pieza.tipo }
    assert_redirected_to pieza_path(assigns(:pieza))
  end

  test "should destroy pieza" do
    assert_difference('Pieza.count', -1) do
      delete :destroy, id: @pieza
    end

    assert_redirected_to piezas_path
  end
end
