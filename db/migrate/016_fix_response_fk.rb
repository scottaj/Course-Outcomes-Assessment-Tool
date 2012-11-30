class FixResponseFk < ActiveRecord::Migration
  def self.up
    rename_column :survey_responses, :survey_questions_id, :survey_question_id
  end

  def self.down
    rename_column :survey_responses, :survey_question_id, :survey_questions_id    
  end
end
