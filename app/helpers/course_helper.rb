# Helper methods defined here can be accessed in any controller or view in the application

CourseOutcomes.helpers do
  def get_all_courses(archived)
    # This line can be a bit confusing. What it is doing is
    # getting every unarchived course from all terms and then
    # dividing those courses into subsets according to term
    # year. It is then dividing each of those subsets into
    # subsets according to term number. 
    courses = Set.new(Course.find_all_by_archived(archived)).divide {|c| c.term_year}.map {|year| year.divide{|c| c.term_number}}
  end

  def get_surrounding_years(back, forward)
    return ((Date.today.year - back)..(Date.today.year + forward))
  end
end
