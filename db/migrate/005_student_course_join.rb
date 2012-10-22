class StudentCourseJoin < ActiveRecord::Migration
  def self.up
    create_table :courses_students, :id => false do |t|
      t.references :student, :null => false
      t.references :course, :null => false
     end
  end

  def self.down
    drop_table :students_courses
  end
end
