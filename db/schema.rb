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

ActiveRecord::Schema.define(:version => 20110826041458) do

  create_table "bets", :force => true do |t|
    t.integer  "round_id"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "championships", :force => true do |t|
    t.string   "name"
    t.date     "started_on"
    t.date     "ended_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "championships", ["name"], :name => "index_championships_on_name"

  create_table "games", :force => true do |t|
    t.integer  "round_id"
    t.integer  "team_1_id"
    t.integer  "team_2_id"
    t.date     "game_day"
    t.time     "game_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hunches", :force => true do |t|
    t.integer  "bet_id"
    t.integer  "game_id"
    t.integer  "team_1_hunch", :default => 0
    t.integer  "team_2_hunch", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", :force => true do |t|
    t.integer  "championship_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rounds", ["championship_id"], :name => "index_rounds_on_championship_id"
  add_index "rounds", ["name"], :name => "index_rounds_on_name"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["name"], :name => "index_teams_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nickname",                                              :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profile"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["nickname"], :name => "index_users_on_nickname", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
