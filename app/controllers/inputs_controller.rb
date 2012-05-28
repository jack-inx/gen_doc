class InputsController < ApplicationController

  require 'rest-client'
  require 'date'
  require 'json'
  
  def new
    @input = Input.new
  end

  def create
    @input = Input.new
    if @input.save
      @render_url = "https://dws.docmosis.com/services/rs/render"
      @access_key = "access key" #enter your access key here

      @template = "GENEX_PAS_TEMPLATE.odt"
      # The output file name
      @output="#{Rails.root}/public/GENEX_PAS_#{@input.id}.doc";


      RestClient.proxy = ENV['http_proxy'];

      RestClient.post(@render_url,
        {
          'accessKey' => @access_key,
          'templateName' => @template,
          'outputName' => @output,
          'data' => {
            'date' => Date.today,
            'display_claimant_name' => @input.display_claimant_name,
            'jurisdictional_state' => @input.jurisdictional_state,
            'claim_number' => @input.claim_number,
            'call_log.talked_to' => @input.talked_to,
            'call_log.call_datetime' => @input.call_datetime,
            'call_log.call_notes' => @input.call_notes,
            'diagnosis' => @input.diagnosis,
            'referral_document.document_date_mdy' => @input.document_date_mdy,
            'referral_document.name' => @input.name,
            'referral_document.suffix' => @input.suffix,
            'referral_document.description' => @input.ref_doc_description,
            'additional_question.description' => @input.add_que_description,
            'additional_question.response' => @input.response,
            'additional_question.opinion' => @input.opinion,
            'ur_recommendation_name' => @input.recommendation_name,
            'clinical_summary' => @input.clinical_summary,
            'rationale' => @input.rationale,
            'cited_guidelines' => @input.cited_guidelines,
            'reviewer_display_name' => @input.reviewer_display_name,
            'reviewer_specialty_name' => @input.reviewer_specialty_name,
            'reviewer_license_description' => @input.reviewer_license_description
          }
        }.to_json, :content_type => :json) {|response, request, result, &block|
        case response.code
        when 200
          File.open(@output,"w"){|f|f.syswrite(response.to_s)}
        else
          puts "Error response:\n\n#{response.code} #{response}\n\n"
          response.return!(request, result, &block)
        end
      }
    end
    redirect_to inputs_new_path
  end
end
