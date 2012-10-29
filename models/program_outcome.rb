class ProgramOutcome < ActiveRecord::Base
  has_and_belongs_to_many :outcomes, class_name: "Outcome"

  validates_uniqueness_of :enum
  validates_presence_of :outcome
  
  before_create do
    self.enum ||= generate_enum
  end

  def generate_enum()
    max = Set.new(ProgramOutcome.all).divide {|i| i.enum.size}.sort_by {|j| j.first.enum.size}.map {|k| k.sort_by{|l| l.enum}}.flatten.reverse[0]

    # Then select the first item and return its successor or "a".
    return max ? max.enum.succ : "a"
  end
end
