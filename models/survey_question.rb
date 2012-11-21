###
# SURVEY QUESTION MODEL
#
# Accessor Methods
#   question  => Text
#   course    => Course Model Instance
#   responses => Array of SurveyResponse Model Instances
#   outcomes  => Array of Outcome Model Instances
#
class SurveyQuestion < ActiveRecord::Base
  belongs_to :course, class_name: "Course", foreign_key: "courses_id", inverse_of: :survey_questions
  has_many :responses,  dependent: :nullify, inverse_of: :question
  has_and_belongs_to_many :outcomes, class_name: "Outcome"
end
