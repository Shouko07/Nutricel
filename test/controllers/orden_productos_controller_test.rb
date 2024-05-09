require "test_helper"

class OrdenProductosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orden_producto = orden_productos(:one)
  end

  test "should get index" do
    get orden_productos_url
    assert_response :success
  end

  test "should get new" do
    get new_orden_producto_url
    assert_response :success
  end

  test "should create orden_producto" do
    assert_difference("OrdenProducto.count") do
      post orden_productos_url, params: { orden_producto: { cantidad_ordenada: @orden_producto.cantidad_ordenada, fecha_entrega: @orden_producto.fecha_entrega, fecha_inicial: @orden_producto.fecha_inicial, folio_id: @orden_producto.folio_id, producto_id: @orden_producto.producto_id, proveedor_id: @orden_producto.proveedor_id } }
    end

    assert_redirected_to orden_producto_url(OrdenProducto.last)
  end

  test "should show orden_producto" do
    get orden_producto_url(@orden_producto)
    assert_response :success
  end

  test "should get edit" do
    get edit_orden_producto_url(@orden_producto)
    assert_response :success
  end

  test "should update orden_producto" do
    patch orden_producto_url(@orden_producto), params: { orden_producto: { cantidad_ordenada: @orden_producto.cantidad_ordenada, fecha_entrega: @orden_producto.fecha_entrega, fecha_inicial: @orden_producto.fecha_inicial, folio_id: @orden_producto.folio_id, producto_id: @orden_producto.producto_id, proveedor_id: @orden_producto.proveedor_id } }
    assert_redirected_to orden_producto_url(@orden_producto)
  end

  test "should destroy orden_producto" do
    assert_difference("OrdenProducto.count", -1) do
      delete orden_producto_url(@orden_producto)
    end

    assert_redirected_to orden_productos_url
  end
end
