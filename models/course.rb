class Course < ActiveRecord::Base
  belongs_to :professor, class_name: "User", foreign_key: "user_id", inverse_of: :courses

  validates_presence_of :course_name, :course_title, :term_number, :term_year, :professor, message: "Please enter all required fields"
end
