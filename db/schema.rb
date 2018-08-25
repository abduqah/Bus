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

ActiveRecord::Schema.define(version: 20180330121041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businfos", force: :cascade do |t|
    t.string "busID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "institution_id"
    t.index ["institution_id"], name: "index_businfos_on_institution_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.integer "licence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "person_id"
    t.index ["person_id"], name: "index_drivers_on_person_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "gid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "institution_id"
    t.index ["institution_id"], name: "index_groups_on_institution_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lifts", force: :cascade do |t|
    t.string "from_to"
    t.string "location"
    t.boolean "shareable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "institution_id"
    t.bigint "teacher_id"
    t.bigint "driver_id"
    t.bigint "businfo_id"
    t.index ["businfo_id"], name: "index_lifts_on_businfo_id"
    t.index ["driver_id"], name: "index_lifts_on_driver_id"
    t.index ["institution_id"], name: "index_lifts_on_institution_id"
    t.index ["teacher_id"], name: "index_lifts_on_teacher_id"
  end

  create_table "parents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "person_id"
    t.index ["person_id"], name: "index_parents_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.integer "nid"
    t.string "name"
    t.string "email"
    t.integer "phoneN"
    t.string "live_in"
    t.datetime "bd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "institution_id"
    t.index ["institution_id"], name: "index_people_on_institution_id"
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lifts_id"
    t.bigint "parent_id"
    t.bigint "group_id"
    t.bigint "person_id"
    t.index ["group_id"], name: "index_students_on_group_id"
    t.index ["lifts_id"], name: "index_students_on_lifts_id"
    t.index ["parent_id"], name: "index_students_on_parent_id"
    t.index ["person_id"], name: "index_students_on_person_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "degree"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "person_id"
    t.index ["person_id"], name: "index_teachers_on_person_id"
  end

  add_foreign_key "businfos", "institutions"
  add_foreign_key "drivers", "people"
  add_foreign_key "groups", "institutions"
  add_foreign_key "lifts", "businfos"
  add_foreign_key "lifts", "drivers"
  add_foreign_key "lifts", "institutions"
  add_foreign_key "lifts", "teachers"
  add_foreign_key "parents", "people"
  add_foreign_key "people", "institutions"
  add_foreign_key "students", "groups"
  add_foreign_key "students", "lifts", column: "lifts_id"
  add_foreign_key "students", "parents"
  add_foreign_key "students", "people"
  add_foreign_key "teachers", "people"
end
