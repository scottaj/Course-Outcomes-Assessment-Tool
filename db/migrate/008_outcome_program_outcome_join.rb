class OutcomeProgramOutcomeJoin < ActiveRecord::Migration
  def self.up
    create_table :outcomes_program_outcomes, id: false do |t|
      t.references :outcome, null: false
      t.references :program_outcome, null: false
    end
  end

  def self.down
    drop_table :outcomes_program_outcomes
  end
end
