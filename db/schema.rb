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

ActiveRecord::Schema.define(version: 2021_05_20_004558) do

  create_table "enderecos", force: :cascade do |t|
    t.string "cep"
    t.string "cidade"
    t.string "bairro"
    t.string "logradouro"
    t.string "complemento"
    t.integer "usuario_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["usuario_id"], name: "index_enderecos_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome_completo", default: "", null: false
    t.date "data_nascimento", null: false
    t.string "cpf", default: "", null: false
    t.string "nome_mae", default: "", null: false
    t.string "telefone", default: "", null: false
    t.string "email", default: "", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vacinas", force: :cascade do |t|
    t.string "nome_vacina", null: false
    t.text "localizacao", null: false
    t.date "data", null: false
    t.datetime "horario", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "usuario_id"
    t.index ["usuario_id"], name: "index_vacinas_on_usuario_id"
  end

  add_foreign_key "enderecos", "usuarios"
  add_foreign_key "vacinas", "usuarios"
end
