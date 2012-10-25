class Outcome < ActiveRecord::Base
  belongs_to :course, class_name: "Course", foreign_key: "course_id", inverse_of: :outcomes

  has_and_belongs_to_many :program_outcomes, class_name: "ProgramOutcome"
  
  validates_uniqueness_of :enum, scope: :course_id
  validates_presence_of :course
  
  before_create do
    self.enum ||= generate_enum()
  end

  def generate_enum()
    # Make a set of all enums for the current courses objectives.
    enums = Set.new(Outcome.find_all_by_course_id(self.course_id).map {|c| c.enum})

    # Sort enums first by length and then alphabetically within that, descending.
    max = enums.divide {|i| i.size}.sort_by {|j| j.first.size}.map {|k| k.sort}.flatten.reverse[0]

    # Then select the first item and return its successor or "a".
    return max ? max.succ : "a"
  end
end
