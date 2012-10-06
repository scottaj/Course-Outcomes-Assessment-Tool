class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :course_name
      t.string :course_title
      t.integer :section, default: 1
      t.integer :term_number
      t.integer :term_year
      t.boolean :archived, default: false
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
