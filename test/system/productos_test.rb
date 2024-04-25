require "application_system_test_case"

class ProductosTest < ApplicationSystemTestCase
  setup do
    @producto = productos(:one)
  end

  test "visiting the index" do
    visit productos_url
    assert_selector "h1", text: "Productos"
  end

  test "should create producto" do
    visit productos_url
    click_on "New producto"

    fill_in "Fecha expiracion", with: @producto.fecha_expiracion
    fill_in "Id producto", with: @producto.id_producto
    fill_in "Imagen", with: @producto.imagen
    fill_in "Nombre", with: @producto.nombre
    fill_in "Peso", with: @producto.peso
    fill_in "Precio", with: @producto.precio
    click_on "Create Producto"

    assert_text "Producto was successfully created"
    click_on "Back"
  end

  test "should update Producto" do
    visit producto_url(@producto)
    click_on "Edit this producto", match: :first

    fill_in "Fecha expiracion", with: @producto.fecha_expiracion
    fill_in "Id producto", with: @producto.id_producto
    fill_in "Imagen", with: @producto.imagen
    fill_in "Nombre", with: @producto.nombre
    fill_in "Peso", with: @producto.peso
    fill_in "Precio", with: @producto.precio
    click_on "Update Producto"

    assert_text "Producto was successfully updated"
    click_on "Back"
  end

  test "should destroy Producto" do
    visit producto_url(@producto)
    click_on "Destroy this producto", match: :first

    assert_text "Producto was successfully destroyed"
  end
end
