# Helper methods defined here can be accessed in any controller or view in the application

CourseOutcomes.helpers do
  def get_all_courses(archived)
    courses = Set.new(Course.find_all_by_archived(archived)).divide {|c| c.term_year}.map {|year| year.divide{|c| c.term_number}}
  end

  def get_surrounding_years(back, forward)
    return ((Date.today.year - back)..(Date.today.year + forward))
  end
end
