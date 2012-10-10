CourseOutcomes.controllers :course do
  get :create do
    errors = session[:errors] || []
    session[:errors] = nil
    dates = ((Date.today.year - 5)..(Date.today.year + 2))
    professors = User.all.map {|u| [u.name, u.username]}
    render "course/create", locals: {page_title: "Create Course", errors: errors, dates: dates.to_a.reverse, professors: professors}
  end

  post :create do
    session[:errors] = nil
    course = Course.new(course_title: params[:course_title],
                        section: params[:section],
                        course_name: params[:course_name],
                        term_number: params[:term_number],
                        term_year: params[:term_year])
    course.professor = User.find_by_username(params[:professor])
    
    if course.valid?
      course.save
      redirect "/admin/courses"
    else
      session[:errors] = get_ar_errors(course)
    end
  end
end
