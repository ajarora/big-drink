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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120702202155) do

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id",   :default => 0
    t.string   "commentable_type", :default => ""
    t.string   "title",            :default => ""
    t.text     "body",             :default => ""
    t.string   "subject",          :default => ""
    t.integer  "user_id",          :default => 0,  :null => false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "consumptions", :force => true do |t|
    t.integer  "drinker_id"
    t.integer  "drank_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "consumptions", ["drank_id"], :name => "index_consumptions_on_drank_id"
  add_index "consumptions", ["drinker_id", "drank_id"], :name => "index_consumptions_on_drinker_id_and_drank_id", :unique => true
  add_index "consumptions", ["drinker_id"], :name => "index_consumptions_on_drinker_id"

  create_table "drinks", :force => true do |t|
    t.string   "name"
    t.integer  "venue_id"
    t.string   "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "slug"
    t.string   "drink_image_uid"
  end

  add_index "drinks", ["slug"], :name => "index_drinks_on_slug", :unique => true

  create_table "likes", :force => true do |t|
    t.integer  "liker_id"
    t.integer  "liked_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "likes", ["liked_id"], :name => "index_likes_on_liked_id"
  add_index "likes", ["liker_id", "liked_id"], :name => "index_likes_on_liker_id_and_liked_id", :unique => true
  add_index "likes", ["liker_id"], :name => "index_likes_on_liker_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "fb_uid"
    t.string   "fb_access_token"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "slug"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["fb_uid"], :name => "index_users_on_fb_uid", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "foursquareID"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "slug"
    t.string   "venue_image_uid"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "postalCode"
  end

  add_index "venues", ["foursquareID"], :name => "index_venues_on_foursquareID", :unique => true
  add_index "venues", ["slug"], :name => "index_venues_on_slug", :unique => true

end
