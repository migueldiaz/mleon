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

ActiveRecord::Schema.define(version: 20150218214850) do

  create_table "clases", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.text     "descripcion", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.string   "CIF",        limit: 255
    t.string   "telefono",   limit: 255
    t.string   "email",      limit: 255
    t.text     "direccion",  limit: 65535
    t.text     "notas",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "componentes", force: :cascade do |t|
    t.integer  "modelo_id",  limit: 4
    t.integer  "pieza_id",   limit: 4
    t.integer  "mueble_id",  limit: 4
    t.integer  "cantidad",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "tipo",       limit: 255
  end

  add_index "componentes", ["modelo_id"], name: "index_componentes_on_modelo_id", using: :btree
  add_index "componentes", ["mueble_id"], name: "index_componentes_on_mueble_id", using: :btree
  add_index "componentes", ["pieza_id"], name: "index_componentes_on_pieza_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "pedido_id",    limit: 4
    t.integer  "modelo_id",    limit: 4
    t.integer  "cantidad",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "pedmodelo_id", limit: 4
  end

  add_index "items", ["modelo_id"], name: "index_items_on_modelo_id", using: :btree
  add_index "items", ["pedido_id"], name: "index_items_on_pedido_id", using: :btree
  add_index "items", ["pedmodelo_id"], name: "index_items_on_pedmodelo_id", using: :btree

  create_table "modelos", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.text     "descripcion", limit: 65535
    t.integer  "ancho",       limit: 4
    t.integer  "alto",        limit: 4
    t.integer  "fondo",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "codigo",      limit: 255
    t.integer  "mueble_id",   limit: 4
  end

  add_index "modelos", ["mueble_id"], name: "index_modelos_on_mueble_id", using: :btree

  create_table "muebles", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.text     "descripcion", limit: 65535
    t.float    "ancho",       limit: 24
    t.float    "alto",        limit: 24
    t.float    "fondo",       limit: 24
    t.integer  "clase_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "muebles", ["clase_id"], name: "index_muebles_on_clase_id", using: :btree

  create_table "pedidos", force: :cascade do |t|
    t.integer  "cliente_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "fecha",      limit: 255
    t.string   "estado",     limit: 255
  end

  add_index "pedidos", ["cliente_id"], name: "index_pedidos_on_cliente_id", using: :btree

  create_table "pedmodelos", force: :cascade do |t|
    t.string   "codigo",      limit: 255
    t.string   "nombre",      limit: 255
    t.integer  "alto",        limit: 4
    t.integer  "ancho",       limit: 4
    t.integer  "fondo",       limit: 4
    t.text     "descripcion", limit: 65535
    t.integer  "modelo_id",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "pedmodelos", ["modelo_id"], name: "index_pedmodelos_on_modelo_id", using: :btree

  create_table "piezas", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.string   "tipo",        limit: 255
    t.text     "descripcion", limit: 65535
    t.float    "ancho",       limit: 24
    t.float    "alto",        limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "componentes", "modelos"
  add_foreign_key "componentes", "muebles"
  add_foreign_key "componentes", "piezas"
  add_foreign_key "items", "modelos"
  add_foreign_key "items", "pedidos"
  add_foreign_key "items", "pedmodelos"
  add_foreign_key "modelos", "muebles"
  add_foreign_key "muebles", "clases"
  add_foreign_key "pedidos", "clientes"
  add_foreign_key "pedmodelos", "modelos"
end
