class Student < ActiveRecord::Base
 has_and_belongs_to_many :courses, class_name: "Course"

end