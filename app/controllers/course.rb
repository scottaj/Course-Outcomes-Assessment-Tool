CourseOutcomes.controllers :course do
  get :create do
    errors = session[:errors] || []
    session[:errors] = nil
    dates = get_surrounding_years(5, 2)
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
      redirect request.fullpath
    end
  end

  get :archive, with: :course_id do
    course = Course.find(params[:course_id])
    course.archived = !course.archived
    course.save
    redirect "/admin/courses"
  end

  get :archived do
    courses = get_all_courses(true)
    return partial "/partials/course/course_table", locals: {courses: courses}
  end

  get :detail, with: :course_id do
    errors = session[:errors] || []
    session[:errors] = nil
    course = Course.find(params[:course_id])
    years = get_surrounding_years(5, 2)
    render "/course/detail", locals: {page_title: course.course_title, course: course, years: years.to_a.reverse, errors: errors}
  end

  post :detail, with: :course_id do
    course = Course.find(params[:course_id])
    course.professor = User.find_by_username(params[:professor])

    course.course_title = params[:course_title]
    course.section = params[:section]
    course.course_name = params[:course_name]
    course.term_number = params[:term_number]
    course.term_year = params[:term_year]

    if course.valid?
      course.save
      redirect "/admin/courses"
    else
      session[:errors] = get_ar_errors(course)
      redirect request.fullpath
    end
  end
end
