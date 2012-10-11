CourseOutcomes.controllers :admin do
  get :index do
    render "admin/admin", locals: {page_title: "Admin"}
  end

  get :user do
    render "admin/user/user", locals: {page_title: "User Administration"}
  end

  get :courses do
    # This line can be a bit confusing. What it is doing is
    # getting every unarchived course from all terms and then
    # dividing those courses into subsets according to term
    # year. It is then dividing each of those subsets into
    # subsets according to term number. 
    courses = Set.new(Course.find_all_by_archived(false)).divide {|c| c.term_year}.map {|set| set.divide{|c| c.term_number}}
    
    render "admin/courses", locals: {page_title: "Course Administration", courses: courses}
  end
end
