require 'test_helper'

class MueblesControllerTest < ActionController::TestCase
  setup do
    @mueble = muebles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:muebles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mueble" do
    assert_difference('Mueble.count') do
      post :create, mueble: { alto: @mueble.alto, ancho: @mueble.ancho, descripcion: @mueble.descripcion, familia: @mueble.familia, fondo: @mueble.fondo, nombre: @mueble.nombre }
    end

    assert_redirected_to mueble_path(assigns(:mueble))
  end

  test "should show mueble" do
    get :show, id: @mueble
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mueble
    assert_response :success
  end

  test "should update mueble" do
    patch :update, id: @mueble, mueble: { alto: @mueble.alto, ancho: @mueble.ancho, descripcion: @mueble.descripcion, familia: @mueble.familia, fondo: @mueble.fondo, nombre: @mueble.nombre }
    assert_redirected_to mueble_path(assigns(:mueble))
  end

  test "should destroy mueble" do
    assert_difference('Mueble.count', -1) do
      delete :destroy, id: @mueble
    end

    assert_redirected_to muebles_path
  end
end
