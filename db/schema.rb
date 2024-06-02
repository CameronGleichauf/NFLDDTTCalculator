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

ActiveRecord::Schema[7.1].define(version: 2024_06_02_155518) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "picks", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "round"
    t.integer "number"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_picks_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trade_picks", force: :cascade do |t|
    t.integer "trade_id", null: false
    t.integer "pick_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pick_id"], name: "index_trade_picks_on_pick_id"
    t.index ["trade_id"], name: "index_trade_picks_on_trade_id"
  end

  create_table "trades", force: :cascade do |t|
    t.integer "starting_team_id", null: false
    t.integer "target_team_id", null: false
    t.float "starting_team_total_value"
    t.float "target_team_total_value"
    t.string "winner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["starting_team_id"], name: "index_trades_on_starting_team_id"
    t.index ["target_team_id"], name: "index_trades_on_target_team_id"
  end

  add_foreign_key "picks", "teams"
  add_foreign_key "trade_picks", "picks"
  add_foreign_key "trade_picks", "trades", on_delete: :cascade
  add_foreign_key "trades", "teams", column: "starting_team_id"
  add_foreign_key "trades", "teams", column: "target_team_id"
end
