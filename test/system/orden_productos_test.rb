require "application_system_test_case"

class OrdenProductosTest < ApplicationSystemTestCase
  setup do
    @orden_producto = orden_productos(:one)
  end

  test "visiting the index" do
    visit orden_productos_url
    assert_selector "h1", text: "Orden productos"
  end

  test "should create orden producto" do
    visit orden_productos_url
    click_on "New orden producto"

    fill_in "Cantidad ordenada", with: @orden_producto.cantidad_ordenada
    fill_in "Fecha entrega", with: @orden_producto.fecha_entrega
    fill_in "Fecha inicial", with: @orden_producto.fecha_inicial
    fill_in "Folio", with: @orden_producto.folio_id
    fill_in "Producto", with: @orden_producto.producto_id
    fill_in "Proveedor", with: @orden_producto.proveedor_id
    click_on "Create Orden producto"

    assert_text "Orden producto was successfully created"
    click_on "Back"
  end

  test "should update Orden producto" do
    visit orden_producto_url(@orden_producto)
    click_on "Edit this orden producto", match: :first

    fill_in "Cantidad ordenada", with: @orden_producto.cantidad_ordenada
    fill_in "Fecha entrega", with: @orden_producto.fecha_entrega
    fill_in "Fecha inicial", with: @orden_producto.fecha_inicial
    fill_in "Folio", with: @orden_producto.folio_id
    fill_in "Producto", with: @orden_producto.producto_id
    fill_in "Proveedor", with: @orden_producto.proveedor_id
    click_on "Update Orden producto"

    assert_text "Orden producto was successfully updated"
    click_on "Back"
  end

  test "should destroy Orden producto" do
    visit orden_producto_url(@orden_producto)
    click_on "Destroy this orden producto", match: :first

    assert_text "Orden producto was successfully destroyed"
  end
end
