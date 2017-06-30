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

ActiveRecord::Schema.define(version: 20170531134129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bancos", force: :cascade do |t|
    t.date     "f_creado"
    t.text     "nombre"
    t.text     "tipo_cuenta"
    t.string   "numero_cuenta"
    t.text     "titular"
    t.string   "cedula"
    t.string   "correo"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "f_eliminado"
  end

  create_table "carritos", force: :cascade do |t|
    t.boolean "abierto",                  default: true
    t.string  "celular",       limit: 11
    t.integer "producto_id"
    t.integer "compra_id"
    t.integer "cantidad",                 default: 1
    t.float   "precio"
    t.date    "f_creado"
    t.date    "f_actualizado"
    t.date    "f_eliminado"
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id", using: :btree
  end

  create_table "compras", force: :cascade do |t|
    t.string  "celular",         limit: 11
    t.integer "banco_id"
    t.date    "f_creada"
    t.date    "f_verificada"
    t.date    "f_entregada"
    t.date    "f_dot"
    t.date    "f_eliminada"
    t.string  "numero_dot",      limit: 15
    t.string  "dep_o_trans_dot", limit: 3,  default: "---"
  end

  create_table "libros", primary_key: "codigo", id: :integer, default: -> { "nextval('sec_codigolibros'::regclass)" }, force: :cascade do |t|
    t.string "titulo",    limit: 30
    t.string "autor",     limit: 30
    t.string "editorial", limit: 15
  end

  create_table "productos", force: :cascade do |t|
    t.date     "f_creado"
    t.date     "f_eliminado"
    t.boolean  "disponible"
    t.integer  "cantidad_por_venta",  default: 1
    t.integer  "cantidad_existencia"
    t.text     "nombre"
    t.text     "descripcion"
    t.float    "precio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", primary_key: "celular", id: :string, limit: 11, force: :cascade do |t|
    t.string   "contrasena",    limit: 10,                   null: false
    t.string   "token",         limit: 10
    t.boolean  "recuerdame",               default: false
    t.text     "rol",                      default: "opera"
    t.text     "nombre"
    t.text     "ubicacion"
    t.string   "correo",        limit: 30
    t.text     "gerencia"
    t.string   "telefono",      limit: 11
    t.datetime "fh_sesion"
    t.date     "f_creado"
    t.date     "f_actualizado"
    t.date     "f_eliminado"
    t.integer  "articulo_ids"
  end

  create_table "vigentes", force: :cascade do |t|
    t.integer  "dias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "carritos", "compras", name: "carritos_compra_id_fkey"
  add_foreign_key "carritos", "productos", name: "carritos_producto_id_fkey"
  add_foreign_key "carritos", "usuarios", column: "celular", primary_key: "celular", name: "carritos_celular_fkey"
  add_foreign_key "comments", "articles"
  add_foreign_key "compras", "bancos", name: "compras_banco_id_fkey"
  add_foreign_key "compras", "usuarios", column: "celular", primary_key: "celular", name: "compras_celular_fkey"
end
