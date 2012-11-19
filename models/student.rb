###
# STUDENT MODEL
#
# Accessor Fields:
#   id              => Integer primary key
#   student_id      => String
#   first_name      => String
#   last_name       => String
#   courses         => Array of Course Model Instances
#   survey_trackers => Array of SurveyTracker Model Instances
#
class Student < ActiveRecord::Base
  has_and_belongs_to_many :courses, class_name: "Course"
  has_many :survey_trackers, dependent: :nullify, inverse_of: :student
  
  validates_format_of :student_id, with: /^T[0-9]{8}$/i, message: "T-Number format must be T########"
  validates_uniqueness_of :student_id, message: "T-Number must be unique!"
end
