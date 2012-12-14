###
# PROGRAM OUTCOME MODEL
#
# Accessor Methods:
#   id       => Integer primary key
#   enum     => String, default "a" or the max enum plus 1
#   outcome  => String
#   outcomes => Array of Outcome Model Instances
#
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

  def outcome_average(cond = {})
    outcomes = self.outcomes.where(cond)

    averages = outcomes.map {|o| o.outcome_average}.find_all {|avg| avg > 0}

    return averages.inject(:+) / averages.size.to_f

  rescue NoMethodError, ZeroDivisionError
    return 0
  end
  
  def passing_by_average?(cond = {})
    return self.outcome_average(cond) >= 0.7
  end
  
  def passing_by_count?(cond = {})
    statuses = self.outcomes.where(cond).map {|o| o.passing?}
    average = statuses.find_all {|stat| stat}.size / statuses.size.to_f

    return average >= 0.7

  rescue ZeroDivisionError, NoMethodError
    return false
  end

  def passing?(cond = {})
    return (self.passing_by_count?(cond) and self.passing_by_average?(cond))
  end
end
