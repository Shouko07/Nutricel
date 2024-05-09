require "application_system_test_case"

class ProveedorsTest < ApplicationSystemTestCase
  setup do
    @proveedor = proveedors(:one)
  end

  test "visiting the index" do
    visit proveedors_url
    assert_selector "h1", text: "Proveedors"
  end

  test "should create proveedor" do
    visit proveedors_url
    click_on "New proveedor"

    fill_in "Apellido materno", with: @proveedor.apellido_materno
    fill_in "Apellido paterno", with: @proveedor.apellido_paterno
    fill_in "Correo", with: @proveedor.correo
    fill_in "Direccion", with: @proveedor.direccion
    fill_in "Nombre", with: @proveedor.nombre
    fill_in "Proveedor", with: @proveedor.proveedor_id
    fill_in "Telefono", with: @proveedor.telefono
    click_on "Create Proveedor"

    assert_text "Proveedor was successfully created"
    click_on "Back"
  end

  test "should update Proveedor" do
    visit proveedor_url(@proveedor)
    click_on "Edit this proveedor", match: :first

    fill_in "Apellido materno", with: @proveedor.apellido_materno
    fill_in "Apellido paterno", with: @proveedor.apellido_paterno
    fill_in "Correo", with: @proveedor.correo
    fill_in "Direccion", with: @proveedor.direccion
    fill_in "Nombre", with: @proveedor.nombre
    fill_in "Proveedor", with: @proveedor.proveedor_id
    fill_in "Telefono", with: @proveedor.telefono
    click_on "Update Proveedor"

    assert_text "Proveedor was successfully updated"
    click_on "Back"
  end

  test "should destroy Proveedor" do
    visit proveedor_url(@proveedor)
    click_on "Destroy this proveedor", match: :first

    assert_text "Proveedor was successfully destroyed"
  end
end
