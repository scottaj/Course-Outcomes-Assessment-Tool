class SurveyQuestionOutcomes < ActiveRecord::Migration
  def self.up
    create_table :outcomes_survey_questions, :id => false do |t|
      t.references :outcome, :null => false
      t.references :survey_question, :null => false
     end
  end

  def self.down
    drop_table :outcomes_survey_questions
  end
end
