class CreateInputs < ActiveRecord::Migration
  def change
    create_table :inputs do |t|
      t.string :display_claimant_name
      t.string :jurisdictional_state
      t.string :claim_number
      t.string :talked_to
      t.datetime :call_datetime
      t.text :call_notes
      t.string :diagnosis
      t.date :document_date_mdy
      t.string :name
      t.string :suffix
      t.text :ref_doc_description
      t.text :add_que_description
      t.text :response
      t.text :opinion
      t.string :recommendation_name
      t.text :clinical_summary
      t.text :rationale
      t.text :cited_guidelines
      t.string :reviewer_display_name
      t.string :reviewer_specialty_name
      t.string :reviewer_license_description

      t.timestamps
    end
  end
end
