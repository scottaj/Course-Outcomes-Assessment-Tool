class ProgramOutcome < ActiveRecord::Base
  has_and_belongs_to_many :outcomes, class_name: "Outcome"

  validates_uniqueness_of :enum
  validates_presence_of :outcome
  
  before_create do
    self.enum ||= generate_enum
  end

  after_destroy do
    adjust_enums
  end
  
  def generate_enum()
    max = Set.new(ProgramOutcome.all).divide {|i| i.enum.size}.sort_by {|j| j.first.enum.size}.map {|k| k.sort_by{|l| l.enum}}.flatten.reverse[0]

    # Then select the first item and return its successor or "a".
    return max ? max.enum.succ : "a"
  end

  def adjust_enums()
    enums = ProgramOutcome.all(order: "enum ASC").map {|i| i.enum}
    c = "a"

    # Find the missing enum
    while enums.include?(c)
      c.succ!
    end

    # Nothing to do if we removed the last outcome.
    unless enums.size == 0 or c > enums[-1]
      enum_to_adjust = ProgramOutcome.find_by_enum(c.succ)
      while enum_to_adjust
        enum_to_adjust.enum = c
        enum_to_adjust.save
        c.succ!
        enum_to_adjust = ProgramOutcome.find_by_enum(c.succ)
      end
    end
  end
end
