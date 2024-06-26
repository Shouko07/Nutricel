# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_26_223921) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventarios", force: :cascade do |t|
    t.integer "inventario_id"
    t.integer "existencias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "producto_id"
    t.index ["inventario_id"], name: "index_inventarios_on_inventario_id"
    t.index ["producto_id"], name: "index_inventarios_on_producto_id"
  end

  create_table "orden_productos", force: :cascade do |t|
    t.integer "folio_id"
    t.integer "cantidad_ordenada"
    t.datetime "fecha_inicial"
    t.datetime "fecha_entrega"
    t.integer "proveedor_id"
    t.integer "producto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer "cantidad_ordenada"
    t.datetime "fecha_inicial"
    t.datetime "fecha_entrega"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "usuario_id"
    t.integer "producto_id"
    t.integer "pedido_id"
    t.index ["usuario_id"], name: "index_pedidos_on_usuario_id"
  end

  create_table "productos", force: :cascade do |t|
    t.integer "producto_id"
    t.string "nombre"
    t.decimal "precio"
    t.decimal "peso"
    t.string "imagen"
    t.datetime "fecha_expiracion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "proveedor_id"
    t.index ["producto_id"], name: "index_productos_on_producto_id"
  end

  create_table "proveedors", force: :cascade do |t|
    t.integer "proveedor_id"
    t.string "nombre"
    t.string "telefono"
    t.string "direccion"
    t.string "correo"
    t.string "apellido_paterno"
    t.string "apellido_materno"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proveedor_id"], name: "index_proveedors_on_proveedor_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
    t.string "apellido_paterno"
    t.string "apellido_materno"
    t.string "telefono"
    t.string "calle"
    t.string "colonia"
    t.string "codigo_postal"
    t.string "ciudad"
    t.string "pais"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "inventarios", "productos"
end
