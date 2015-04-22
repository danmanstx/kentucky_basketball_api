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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150417183207) do
  create_table 'box_scores', force: :cascade do |t|
    t.text     'full_game'
    t.text     'play_by_play'
    t.text     'first_half'
    t.text     'second_half'
    t.text     'newspaper'
    t.text     'play_analysis'
    t.datetime 'created_at',    null: false
    t.datetime 'updated_at',    null: false
  end

  create_table 'games', force: :cascade do |t|
    t.integer  'home_team_id'
    t.integer  'away_team_id'
    t.integer  'home_score'
    t.integer  'away_score'
    t.integer  'overtime'
    t.integer  'game_type'
    t.date     'date'
    t.datetime 'created_at',   null: false
    t.datetime 'updated_at',   null: false
  end

  add_index 'games', ['away_team_id'], name: 'index_games_on_away_team_id'
  add_index 'games', ['home_team_id'], name: 'index_games_on_home_team_id'

  create_table 'rosters', force: :cascade do |t|
    t.integer  'team_id'
    t.text     'name'
    t.text     'height'
    t.text     'year'
    t.integer  'number'
    t.text     'hometown'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_index 'rosters', ['team_id'], name: 'index_rosters_on_team_id'

  create_table 'schools', force: :cascade do |t|
    t.text     'name'
    t.text     'location'
    t.integer  'founded'
    t.text     'mascot'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'teams', force: :cascade do |t|
    t.integer  'year'
    t.text     'coach'
    t.text     'conference'
    t.text     'division'
    t.integer  'school_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_index 'teams', ['school_id'], name: 'index_teams_on_school_id'
end
