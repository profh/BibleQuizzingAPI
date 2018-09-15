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

ActiveRecord::Schema.define(version: 20180724111648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.integer "num_quizzes"
    t.string "filename", limit: 255
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quiz_level", default: 1
    t.decimal "percent_review"
    t.date "date"
  end

  create_table "question_categories", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_types", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "question_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", id: :serial, force: :cascade do |t|
    t.integer "written_by"
    t.integer "approved_by"
    t.integer "question_category_id"
    t.integer "section_id"
    t.string "book", limit: 255
    t.integer "chapter"
    t.string "verse", limit: 255
    t.text "text"
    t.text "answer"
    t.integer "keyword"
    t.datetime "created_on"
    t.datetime "approved_on"
    t.integer "approval_level"
    t.string "approval_reason", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "question_type_id"
    t.integer "difficulty_ranking"
  end

  create_table "quiz_questions", id: :serial, force: :cascade do |t|
    t.integer "quiz_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
  end

  create_table "quiz_sections", id: :serial, force: :cascade do |t|
    t.integer "quiz_id"
    t.integer "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quiz_years", id: :serial, force: :cascade do |t|
    t.integer "year"
    t.boolean "has_situations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
  end

  create_table "quizzes", id: :serial, force: :cascade do |t|
    t.string "filename", limit: 255
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "question_categories", limit: 255
    t.integer "interrogative"
    t.integer "finish_the_verse"
    t.integer "quote"
    t.integer "reference"
    t.integer "multiple_answer"
    t.integer "situation"
    t.integer "event_quiz_number"
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "book", limit: 255
    t.integer "chapter"
    t.integer "start_verse"
    t.integer "end_verse"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
  end

  create_table "user_roles", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username", limit: 255
    t.string "email", limit: 255
    t.string "password_hash", limit: 255
    t.string "password_salt", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.boolean "active"
    t.string "password_reset_token", limit: 255
    t.datetime "password_reset_sent_at"
  end

  create_table "year_books", id: :serial, force: :cascade do |t|
    t.integer "quiz_year_id"
    t.string "book", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
