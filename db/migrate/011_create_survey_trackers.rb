class CreateSurveyTrackers < ActiveRecord::Migration
  def self.up
    create_table :survey_trackers do |t|
      t.references :student, null: false
      t.references :course, null: false
      t.boolean :complete, default: false
    end
  end

  def self.down
    drop_table :survey_trackers
  end
end
