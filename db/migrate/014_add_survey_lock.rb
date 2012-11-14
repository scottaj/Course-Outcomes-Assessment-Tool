class AddSurveyLock < ActiveRecord::Migration
  def self.up
    add_column :survey_responses, :locked, :boolean, default: true
  end

  def self.down
    remove_column :survey_responses, :locked
  end
end
