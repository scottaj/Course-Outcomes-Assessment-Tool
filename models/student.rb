class Student < ActiveRecord::Base
 has_and_belongs_to_many :courses, class_name: "Course"
 
 validates_format_of :student_id, with: /^T[0-9]{8}$/i, message: "T-Number format must be T########"
 validates_uniqueness_of :student_id, message: "T-Number must be unique!"
end
