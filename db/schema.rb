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

ActiveRecord::Schema.define(version: 2022_12_23_125155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "archived_articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "birthdate"
    t.datetime "deathdate"
    t.string "job"
    t.string "birth_country"
    t.string "birth_place"
    t.string "death_country"
    t.string "death_place"
    t.text "resources", default: "[]"
    t.text "duties", default: "[]"
    t.text "columns_data", default: "[]"
    t.text "coordinates", default: ""
    t.float "elevation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "birthdate"
    t.datetime "deathdate"
    t.string "job"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "birth_country"
    t.string "birth_place"
    t.string "death_country"
    t.string "death_place"
    t.text "resources", default: "[]"
    t.text "duties", default: "[]"
    t.text "columns_data", default: "[]"
    t.text "coordinates", default: ""
    t.float "elevation"
    t.index ["title"], name: "index_articles_on_title", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "user_id"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "histories", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "user_id"
    t.datetime "action_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "action_type"
    t.bigint "previous_archived_id"
    t.bigint "next_archived_id"
    t.index ["article_id"], name: "index_histories_on_article_id"
    t.index ["next_archived_id"], name: "index_histories_on_next_archived_id"
    t.index ["previous_archived_id"], name: "index_histories_on_previous_archived_id"
    t.index ["user_id"], name: "index_histories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "histories", "archived_articles", column: "next_archived_id"
  add_foreign_key "histories", "archived_articles", column: "previous_archived_id"
end
