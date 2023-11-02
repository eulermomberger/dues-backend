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

ActiveRecord::Schema[7.0].define(version: 2023_11_01_211115) do
  create_table "due_itens", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "item", null: false
    t.string "nfe_chave", limit: 44, null: false
    t.string "nfe_numero", limit: 9, null: false
    t.string "nfe_serie", limit: 3, null: false
    t.integer "nfe_item", null: false
    t.text "descricao_complementar", size: :long, null: false
    t.string "ncm", limit: 8, null: false
    t.decimal "vmle_moeda", precision: 17, scale: 2
    t.decimal "vmcv_moeda", precision: 17, scale: 2
    t.decimal "peso_liquido", precision: 17, scale: 2
    t.string "enquadramento1", limit: 5
    t.string "enquadramento2", limit: 5
    t.string "enquadramento3", limit: 5
    t.string "enquadramento4", limit: 5
    t.integer "due_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["due_id"], name: "index_due_itens_on_due_id"
  end

  create_table "dues", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "declarante_cpf_cnpj", limit: 14, null: false
    t.string "declarante_razao_social", null: false
    t.string "identificacao", null: false
    t.string "numero", limit: 50, null: false
    t.integer "moeda", null: false
    t.string "incoterm", limit: 3, null: false
    t.text "informacoes_complementares", size: :long
    t.decimal "total_vmle_moeda", precision: 17, scale: 2
    t.decimal "total_vmcv_moeda", precision: 17, scale: 2
    t.decimal "total_peso_liquido", precision: 17, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "due_itens", "dues"
end
