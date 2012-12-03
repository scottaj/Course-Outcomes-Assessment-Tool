###
# SURVEY RESPONSE CLASS
#
# Accessor Methods
#   id       => Integer primary key
#   response => Integer
#   question => SurveyQuestion Model Instance
#
class SurveyResponse < ActiveRecord::Base
  belongs_to :question, class_name: "SurveyQuestion", foreign_key: "survey_question_id", inverse_of: :responses
end
