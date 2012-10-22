class Course < ActiveRecord::Base
  belongs_to :professor, class_name: "User", foreign_key: "user_id", inverse_of: :courses
  has_and_belongs_to_many :students, class_name: "Student"
  

  has_many :outcomes, dependent: :nullify, inverse_of: :course
  
  validates_presence_of :course_name, :course_title, :term_number, :term_year, :professor, message: "Please enter all required fields"

  validates_uniqueness_of :course_title, scope: [:term_year, :term_number, :section]
  def to_s
    return "#{self.course_title.gsub(/\s+/, "").downcase}-#{self.section}-#{self.term_number}-#{self.term_year}"
  end
end


