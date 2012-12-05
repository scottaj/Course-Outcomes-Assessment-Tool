class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.string :name
      t.text :description
      t.integer :number_passing
      t.references :assignment
      t.references :course
      t.timestamps
    end

    create_table :assignments_outcomes, id: false do |t|
      t.references :outcome, null: false
      t.references :assignment, null: false
    end
  end

  def self.down
    drop_table :assignments
    drop_table :assignments_outcomes
  end
end
