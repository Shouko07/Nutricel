require "application_system_test_case"

class ClientesTest < ApplicationSystemTestCase
  setup do
    @cliente = clientes(:one)
  end

  test "visiting the index" do
    visit clientes_url
    assert_selector "h1", text: "Clientes"
  end

  test "should create cliente" do
    visit clientes_url
    click_on "New cliente"

    fill_in "Apellido materno", with: @cliente.apellido_materno
    fill_in "Apellido paterno", with: @cliente.apellido_paterno
    fill_in "Calle", with: @cliente.calle
    fill_in "Ciudad", with: @cliente.ciudad
    fill_in "Codigo postal", with: @cliente.codigo_postal
    fill_in "Colonia", with: @cliente.colonia
    fill_in "Correo", with: @cliente.correo
    fill_in "Nombre", with: @cliente.nombre
    fill_in "Pais", with: @cliente.pais
    fill_in "Telefono", with: @cliente.telefono
    click_on "Create Cliente"

    assert_text "Cliente was successfully created"
    click_on "Back"
  end

  test "should update Cliente" do
    visit cliente_url(@cliente)
    click_on "Edit this cliente", match: :first

    fill_in "Apellido materno", with: @cliente.apellido_materno
    fill_in "Apellido paterno", with: @cliente.apellido_paterno
    fill_in "Calle", with: @cliente.calle
    fill_in "Ciudad", with: @cliente.ciudad
    fill_in "Codigo postal", with: @cliente.codigo_postal
    fill_in "Colonia", with: @cliente.colonia
    fill_in "Correo", with: @cliente.correo
    fill_in "Nombre", with: @cliente.nombre
    fill_in "Pais", with: @cliente.pais
    fill_in "Telefono", with: @cliente.telefono
    click_on "Update Cliente"

    assert_text "Cliente was successfully updated"
    click_on "Back"
  end

  test "should destroy Cliente" do
    visit cliente_url(@cliente)
    click_on "Destroy this cliente", match: :first

    assert_text "Cliente was successfully destroyed"
  end
end
