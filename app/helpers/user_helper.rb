# Helper methods defined here can be accessed in any controller or view in the application

CourseOutcomes.helpers do

  # Return an array of any error messages for an ActiveRecord object.
  def get_ar_errors(ar_object)
    return ar_object.errors.messages.map{|e, v| v}.flatten 
  end
  
  def get_all_users(deactivated)
    deactivated = User.find_all_by_active(deactivated)
  end
end
