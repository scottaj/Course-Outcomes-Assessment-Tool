# Helper methods defined here can be accessed in any controller or view in the application

CourseOutcomes.helpers do
  def get_next_outcome(outcome)
    return outcome.class.find_by_enum(outcome.enum.succ)
  end

  def get_previous_outcome(outcome)
    enum = outcome.enum
    previous_enum = (enum.to_s =~ /^\d+$/ ? 1 : "a")
    previous_enum.upto(enum) {|i| previous_enum = i if i.succ == enum}

    return outcome.class.find_by_enum(previous_enum)
  end
end
