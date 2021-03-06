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

ActiveRecord::Schema.define(:version => 20121212195822) do

  create_table "assets", :force => true do |t|
    t.string   "name"
    t.string   "type_a"
    t.integer  "site_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "authentications", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.string   "secret"
    t.string   "token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "comment"
    t.string   "author"
    t.boolean  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "email"
    t.integer  "tendency"
    t.integer  "reply_to"
    t.integer  "legislature_id"
    t.integer  "site_id"
  end

  create_table "commissions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  create_table "commissions_initiatives", :id => false, :force => true do |t|
    t.integer "commission_id"
    t.integer "initiative_id"
  end

  create_table "commissions_representatives", :id => false, :force => true do |t|
    t.integer "commission_id"
    t.integer "representative_id"
  end

  create_table "configurables", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "site_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "configurables", ["name"], :name => "index_configurables_on_name"

  create_table "initiatives", :force => true do |t|
    t.datetime "presented_at"
    t.text     "description"
    t.text     "title"
    t.string   "presented_by"
    t.text     "additional_resources"
    t.string   "additional_resources_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.integer  "official_vote_up",          :default => 0
    t.integer  "official_vote_down",        :default => 0
    t.integer  "representative_id"
    t.boolean  "main"
    t.integer  "political_party_id"
    t.datetime "voted_at"
    t.integer  "official_vote_abstentions"
    t.integer  "comments_count",            :default => 0
    t.string   "number"
    t.integer  "legislature_id"
    t.integer  "site_id"
    t.integer  "state_id"
  end

  create_table "initiatives_topics", :id => false, :force => true do |t|
    t.integer "initiative_id"
    t.integer "topic_id"
  end

  create_table "legislatures", :force => true do |t|
    t.string   "name"
    t.boolean  "active",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  create_table "official_votes", :force => true do |t|
    t.integer  "political_party_id"
    t.integer  "votes"
    t.integer  "initiative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  create_table "permissions", :force => true do |t|
    t.string   "action"
    t.string   "subject_class"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "site_id"
  end

  create_table "political_parties", :force => true do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  create_table "provinces", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "site_id"
  end

  create_table "representatives", :force => true do |t|
    t.string   "position"
    t.integer  "region_id"
    t.integer  "province_id"
    t.string   "avatar"
    t.text     "biography"
    t.string   "birthday"
    t.string   "twitter"
    t.string   "facebook"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "political_party_id"
    t.string   "district"
    t.string   "phone"
    t.string   "email"
    t.string   "substitute"
    t.string   "election_type"
    t.string   "old_commissions"
    t.integer  "comments_count",     :default => 0
    t.string   "circumscription"
    t.integer  "legislature_id"
    t.string   "sex"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "site_id"
  end

  create_table "resources", :force => true do |t|
    t.text     "name"
    t.text     "url"
    t.integer  "initiative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "host"
    t.string   "path"
    t.string   "locale"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "subdomain"
    t.boolean  "custom_layout"
    t.text     "custom_layout_content"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "site_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  create_table "user_permissions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "permission_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin"
    t.boolean  "super_admin"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "site_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "vote"
    t.integer  "initiative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

end
