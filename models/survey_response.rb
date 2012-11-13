class SurveyResponse < ActiveRecord::Base
  belongs_to :question, class_name: "SurveyQuestion", foreign_key: "survey_questions_id", inverse_of: :responses
end
