class MoveSurveyLockToTracker < ActiveRecord::Migration
  def self.up
    remove_column :survey_responses, :locked
    add_column :survey_trackers, :locked, :boolean
  end

  def self.down
    remove_column :survey_trackers, :locked
    add_column :survey_responses, :locked, :boolean
  end
end
