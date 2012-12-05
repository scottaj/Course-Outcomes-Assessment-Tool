class Assignment < ActiveRecord::Base
  has_many :parts, class_name: "Assignment", dependent: :destroy, inverse_of: :parent
  belongs_to :parent, class_name: "Assignment", foreign_key: "assignment_id", inverse_of: :parts
  belongs_to :course, class_name: "Course", foreign_key: "course_id", inverse_of: :assignments
  has_and_belongs_to_many :outcomes, class_name: "Outcome"

  validates_presence_of :name, messsage: "Every assignment must have a name."
end
