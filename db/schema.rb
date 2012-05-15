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

ActiveRecord::Schema.define(:version => 20120514040536) do

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
    t.string   "image_url"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  add_index "drinks", ["slug"], :name => "index_drinks_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "fb_uid"
    t.string   "fb_access_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "slug"
  end

  add_index "users", ["fb_uid"], :name => "index_users_on_fb_uid", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "foursquareID"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "slug"
  end

  add_index "venues", ["foursquareID"], :name => "index_venues_on_foursquareID", :unique => true
  add_index "venues", ["slug"], :name => "index_venues_on_slug", :unique => true

end
