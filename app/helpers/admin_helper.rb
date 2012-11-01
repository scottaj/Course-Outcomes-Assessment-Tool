# Helper methods defined here can be accessed in any controller or view in the application

CourseOutcomes.helpers do
  def get_next_outcome(enum)
    return ProgramOutcome.find_by_enum(enum.succ)
  end

  def get_previous_outcome(enum)
    previous_enum = (enum =~ /^\d+$/ ? 1 : "a")
    previous_enum.upto(enum) {|i| previous_enum = i if i.succ == enum}

    return ProgramOutcome.find_by_enum(previous_enum)
  end
end
