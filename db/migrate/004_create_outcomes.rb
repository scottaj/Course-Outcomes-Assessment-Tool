class CreateOutcomes < ActiveRecord::Migration
  def self.up
    create_table :outcomes do |t|
      t.string :enum
      t.text :outcome
      t.integer :course_id
      t.timestamps
    end
  end

  def self.down
    drop_table :outcomes
  end
end
