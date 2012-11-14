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

ActiveRecord::Schema.define(:version => 14) do

  create_table "courses", :force => true do |t|
    t.string   "course_name"
    t.string   "course_title"
    t.integer  "section",      :default => 1
    t.integer  "term_number"
    t.integer  "term_year"
    t.boolean  "archived",     :default => false
    t.integer  "user_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "courses_students", :id => false, :force => true do |t|
    t.integer "student_id", :null => false
    t.integer "course_id",  :null => false
  end

  create_table "outcomes", :force => true do |t|
    t.integer  "enum"
    t.text     "outcome"
    t.integer  "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "outcomes_program_outcomes", :id => false, :force => true do |t|
    t.integer "outcome_id",         :null => false
    t.integer "program_outcome_id", :null => false
  end

  create_table "program_outcomes", :force => true do |t|
    t.string   "enum"
    t.string   "outcome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "student_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "survey_questions", :force => true do |t|
    t.text     "question"
    t.integer  "courses_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "survey_responses", :force => true do |t|
    t.integer  "survey_questions_id"
    t.integer  "response"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.boolean  "locked",              :default => true
  end

  create_table "survey_trackers", :force => true do |t|
    t.integer "student_id",                    :null => false
    t.integer "course_id",                     :null => false
    t.boolean "complete",   :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "active"
    t.integer  "role"
  end

end
