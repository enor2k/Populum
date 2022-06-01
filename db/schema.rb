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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2022_06_01_085225) do
=======
ActiveRecord::Schema.define(version: 2022_05_31_130232) do
>>>>>>> master

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "answer_fields"
    t.bigint "user_id", null: false
    t.bigint "question_id", null: false
    t.bigint "option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["option_id"], name: "index_answers_on_option_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "comment_votes", force: :cascade do |t|
    t.string "value"
    t.bigint "suggestion_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["suggestion_id"], name: "index_comment_votes_on_suggestion_id"
    t.index ["user_id"], name: "index_comment_votes_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "votes"
    t.bigint "user_id", null: false
    t.bigint "suggestion_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["suggestion_id"], name: "index_comments_on_suggestion_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "title"
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "answer_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "survey_id", null: false
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "suggestion_votes", force: :cascade do |t|
    t.string "value"
    t.bigint "suggestion_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["suggestion_id"], name: "index_suggestion_votes_on_suggestion_id"
    t.index ["user_id"], name: "index_suggestion_votes_on_user_id"
  end

  create_table "suggestions", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "votes"
    t.string "address"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_suggestions_on_user_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "overview"
    t.index ["user_id"], name: "index_surveys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.integer "score"
    t.string "address"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "options"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "comment_votes", "suggestions"
  add_foreign_key "comment_votes", "users"
  add_foreign_key "comments", "suggestions"
  add_foreign_key "comments", "users"
  add_foreign_key "options", "questions"

  add_foreign_key "suggestion_votes", "suggestions"
  add_foreign_key "suggestion_votes", "users"

  add_foreign_key "questions", "surveys"

  add_foreign_key "suggestions", "users"
  add_foreign_key "surveys", "users"
end
