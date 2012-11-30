class FixQuestionCourseFk < ActiveRecord::Migration
  def self.up
    rename_column :survey_questions, :courses_id, :course_id
  end

  def self.down 
    rename_column :survey_questions, :course_id, :courses_id
  end
end
