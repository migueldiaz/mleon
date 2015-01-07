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

ActiveRecord::Schema.define(version: 20150107161026) do

  create_table "componentes", force: :cascade do |t|
    t.integer  "modelo_id",  limit: 4
    t.integer  "pieza_id",   limit: 4
    t.integer  "cantidad",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "componentes", ["modelo_id"], name: "index_componentes_on_modelo_id", using: :btree
  add_index "componentes", ["pieza_id"], name: "index_componentes_on_pieza_id", using: :btree

  create_table "modelos", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.text     "descripcion", limit: 65535
    t.integer  "ancho",       limit: 4
    t.integer  "alto",        limit: 4
    t.integer  "fondo",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "piezas", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.string   "tipo",        limit: 255
    t.text     "descripcion", limit: 65535
    t.integer  "ancho",       limit: 4
    t.integer  "alto",        limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "componentes", "modelos"
  add_foreign_key "componentes", "piezas"
end