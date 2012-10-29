# Helper methods defined here can be accessed in any controller or view in the application

CourseOutcomes.helpers do
  def append_t_number(t_number)
    case t_number
    when /^T[0-9]{8}$/i
      return t_number
    when /^[0-9]{7}$/i
      return "T0#{t_number}"
    when /^[0-9]{8}$/i
      return "T#{t_number}"
    else
    return t_number
  end
    
  end
  # def simple_helper_method
  #  ...
  # end
end
