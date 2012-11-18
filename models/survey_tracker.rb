class SurveyTracker < ActiveRecord::Base
  belongs_to :course, class_name: "Course", foreign_key: "course_id", inverse_of: :survey_trackers
  belongs_to :student, class_name: "Student", foreign_key: "student_id", inverse_of: :survey_trackers
end
