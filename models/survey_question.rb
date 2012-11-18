class SurveyQuestion < ActiveRecord::Base
  belongs_to :course, class_name: "Course", foreign_key: "course_id", inverse_of: :survey_questions
  has_many :responses,  dependent: :nullify, inverse_of: :question
end
