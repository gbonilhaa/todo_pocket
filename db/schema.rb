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

ActiveRecord::Schema.define(version: 20140403205856) do

  create_table "tarefas", force: true do |t|
    t.string   "titulo"
    t.boolean  "concluida",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_id"
  end

  add_index "tarefas", ["usuario_id"], name: "index_tarefas_on_usuario_id"

  create_table "usuarios", force: true do |t|
    t.string   "nomerails"
    t.string   "g"
    t.string   "scaffold"
    t.string   "cadastro"
    t.string   "nome"
    t.string   "email"
    t.string   "password_digest"
    t.text     "endereco"
    t.boolean  "admin"
    t.date     "data_nasc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
