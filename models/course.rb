###
# COURSE MODEL
#
# Accessor Methods:
#   id               => Integer primary key
#   course_name      => String
#   course_title     => String
#   section          => Integer, default: 1
#   term_number      => Integer
#   term_year        => Integer
#   archived         => Boolean, default: false
#   professor        => User Model Instance
#   students         => Array of Student Model Instances
#   outcomes         => Array of Outcome Model Instances
#   survey_trackers  => Array of SurveyTracker Model Instances
#   survey_questions => Array of SurveyQuestion Model Instances
#
class Course < ActiveRecord::Base
  belongs_to :professor, class_name: "User", foreign_key: "user_id", inverse_of: :courses
  has_and_belongs_to_many :students, class_name: "Student"
  
  has_many :outcomes, dependent: :destroy, inverse_of: :course
  has_many :survey_trackers, dependent: :destroy, inverse_of: :course
  has_many :survey_questions, dependent: :destroy, inverse_of: :course
  
  validates_presence_of :course_name, :course_title, :term_number, :term_year, :professor, message: "Please enter all required fields"

  validates_uniqueness_of :course_title, scope: [:term_year, :term_number, :section]

  def to_s
    return "#{self.course_title.gsub(/\s+/, "").downcase}-#{self.section}-#{self.term_number}-#{self.term_year}"
  end
end


