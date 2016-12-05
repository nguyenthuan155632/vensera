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

ActiveRecord::Schema.define(version: 20161205044956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shop_categories", force: :cascade do |t|
    t.string   "category_name"
    t.string   "category_slug"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "category_type"
  end

  create_table "shop_comments", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.index ["commentable_type", "commentable_id"], name: "index_shop_comments_on_commentable_type_and_commentable_id", using: :btree
  end

  create_table "shop_images", force: :cascade do |t|
    t.string   "img_url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.index ["imageable_type", "imageable_id"], name: "index_shop_images_on_imageable_type_and_imageable_id", using: :btree
  end

  create_table "shop_keywords", force: :cascade do |t|
    t.string   "key_string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "key_type"
    t.integer  "key_id"
    t.index ["key_type", "key_id"], name: "index_shop_keywords_on_key_type_and_key_id", using: :btree
  end

  create_table "shop_likes", force: :cascade do |t|
    t.integer  "counter"
    t.integer  "like_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.index ["likeable_type", "likeable_id"], name: "index_shop_likes_on_likeable_type_and_likeable_id", using: :btree
  end

  create_table "shop_order_items", force: :cascade do |t|
    t.integer  "shop_product_id"
    t.integer  "shop_order_id"
    t.decimal  "unit_price"
    t.integer  "quantity"
    t.decimal  "total_price"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["shop_order_id"], name: "index_shop_order_items_on_shop_order_id", using: :btree
    t.index ["shop_product_id"], name: "index_shop_order_items_on_shop_product_id", using: :btree
  end

  create_table "shop_order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_orders", force: :cascade do |t|
    t.decimal  "subtotal"
    t.decimal  "tax"
    t.decimal  "shipping"
    t.decimal  "total"
    t.integer  "shop_order_status_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["shop_order_status_id"], name: "index_shop_orders_on_shop_order_status_id", using: :btree
  end

  create_table "shop_posts", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "thumbnail"
    t.text     "content"
    t.string   "active"
    t.integer  "shop_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["shop_category_id"], name: "index_shop_posts_on_shop_category_id", using: :btree
  end

  create_table "shop_products", force: :cascade do |t|
    t.string   "product_name"
    t.string   "product_slug"
    t.decimal  "price"
    t.integer  "quantity"
    t.string   "thumbnail"
    t.text     "description"
    t.text     "detail"
    t.string   "active"
    t.integer  "shop_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["shop_category_id"], name: "index_shop_products_on_shop_category_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "name"
    t.datetime "birthdate"
    t.string   "address"
    t.string   "phone",                                  null: false
    t.boolean  "is_male",                default: true
    t.boolean  "admin",                  default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  add_foreign_key "shop_order_items", "shop_orders"
  add_foreign_key "shop_order_items", "shop_products"
  add_foreign_key "shop_orders", "shop_order_statuses"
  add_foreign_key "shop_posts", "shop_categories"
  add_foreign_key "shop_products", "shop_categories"
end
