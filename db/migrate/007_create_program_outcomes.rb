class CreateProgramOutcomes < ActiveRecord::Migration
  def self.up
    create_table :program_outcomes do |t|
      t.string :enum
      t.string :outcome
      t.timestamps
    end
  end

  def self.down
    drop_table :program_outcomes
  end
end
