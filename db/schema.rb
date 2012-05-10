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

ActiveRecord::Schema.define(:version => 20120510232000) do

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
