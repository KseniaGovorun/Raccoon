ActiveRecord::Schema[7.2].define(version: 2024_09_11_180639) do
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: nil
  end

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at", precision: nil
  end

  create_table "tweets", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: nil
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end
end
