class ProgramOutcome < ActiveRecord::Base
  has_and_belongs_to_many :outcomes, class_name: "Outcome"

  validates_uniqueness_of :enum
  
  before_create do
    self.enum ||= generate_enum
  end

  def generate_enum()
    # Make a set of all enums for the current courses objectives.
    enums = Set.new(Outcome.find_all_by_course_id(self.course_id).map {|c| c.enum})

    # Sort enums first by length and then alphabetically within that, descending.
    max = sort_by_enums(enums)[0]

    # Then select the first item and return its successor or "a".
    return max ? max.succ : "a"
  end

  def sort_by_enum(enums)
    enums.divide {|i| i.size}.sort_by {|j| j.first.size}.map {|k| k.sort}.flatten.reverse
  end
end
