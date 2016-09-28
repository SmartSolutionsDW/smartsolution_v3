# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160928154959) do

  create_table "administrator_locals", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.integer  "local_id",    limit: 4
    t.string   "estado",      limit: 1
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "administrator_locals", ["employee_id"], name: "index_administrator_locals_on_employee_id", using: :btree
  add_index "administrator_locals", ["local_id"], name: "index_administrator_locals_on_local_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.string   "apellido",   limit: 255
    t.string   "dni",        limit: 255
    t.string   "correo",     limit: 255
    t.string   "password",   limit: 255
    t.boolean  "admin"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "employees", ["dni"], name: "index_employees_on_dni", unique: true, using: :btree

  create_table "eventos", force: :cascade do |t|
    t.integer  "local_id",    limit: 4
    t.datetime "fe_evento"
    t.integer  "capacidad",   limit: 4
    t.string   "descripcion", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "eventos", ["local_id"], name: "index_eventos_on_local_id", using: :btree

  create_table "locals", force: :cascade do |t|
    t.string   "No_Local",     limit: 255
    t.string   "No_Direccion", limit: 255
    t.string   "Nu_Telefono",  limit: 255
    t.string   "Tx_Correo",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "productos", force: :cascade do |t|
    t.string   "Co_Producto",      limit: 255
    t.string   "No_Producto",      limit: 255
    t.decimal  "Ss_Precio",                    precision: 10
    t.integer  "Ct_Stock",         limit: 4
    t.integer  "tipo_producto_id", limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "productos", ["tipo_producto_id"], name: "index_productos_on_tipo_producto_id", using: :btree

  create_table "reservas", force: :cascade do |t|
    t.integer  "co_reserva",     limit: 4
    t.integer  "co_sala",        limit: 4
    t.string   "no_dni",         limit: 255
    t.date     "fe_reserva"
    t.text     "tx_Description", limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "salas", force: :cascade do |t|
    t.integer  "local_id",     limit: 4
    t.integer  "no_sala",      limit: 4
    t.integer  "qt_capacidad", limit: 4
    t.string   "descripcion",  limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "salas", ["local_id"], name: "index_salas_on_local_id", using: :btree

  create_table "tipo_productos", force: :cascade do |t|
    t.string   "Co_TipoProducto",   limit: 255
    t.string   "co_coTipoProducto", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.boolean  "admin"
    t.string   "nombre",                 limit: 255
    t.string   "apellido",               limit: 255
    t.string   "dni",                    limit: 255
    t.boolean  "activo"
    t.string   "uid",                    limit: 255
    t.string   "provider",               limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["dni"], name: "index_users_on_dni", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "administrator_locals", "employees"
  add_foreign_key "administrator_locals", "locals"
  add_foreign_key "eventos", "locals"
  add_foreign_key "productos", "tipo_productos"
  add_foreign_key "salas", "locals"
end
