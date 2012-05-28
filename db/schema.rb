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

ActiveRecord::Schema.define(:version => 20120528105021) do

  create_table "inputs", :force => true do |t|
    t.string   "display_claimant_name"
    t.string   "jurisdictional_state"
    t.string   "claim_number"
    t.string   "talked_to"
    t.datetime "call_datetime"
    t.text     "call_notes"
    t.string   "diagnosis"
    t.date     "document_date_mdy"
    t.string   "name"
    t.string   "suffix"
    t.text     "ref_doc_description"
    t.text     "add_que_description"
    t.text     "response"
    t.text     "opinion"
    t.string   "recommendation_name"
    t.text     "clinical_summary"
    t.text     "rationale"
    t.text     "cited_guidelines"
    t.string   "reviewer_display_name"
    t.string   "reviewer_specialty_name"
    t.string   "reviewer_license_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
