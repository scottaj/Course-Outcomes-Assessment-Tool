class Course < ActiveRecord::Base
  belongs_to :professor, class_name: "User", foreign_key: "user_id", inverse_of: :courses
end
