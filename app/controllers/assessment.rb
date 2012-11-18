CourseOutcomes.controllers :assessment do
  before do
    user = User.find(session[:token])
    if params[:course_id]
      course = Course.find(params[:course_id])
      halt 403 unless course.professor == user or user.admin?
    end
  end

  get :index, map: "/assessment/outcomes", with: :course_id do
    course = Course.find(params[:course_id])
    outcomes = Outcome.find_all_by_course_id(course.id, order: "enum ASC")
    
    render "/assessment/course", locals: {
      page_title: "#{course.course_title}-#{course.section}",
      course: course,
      outcomes: outcomes
    }
  end
  
  get :studentslist, with: :course_id do
    course = Course.find(params[:course_id])
    
    render "/assessment/studentslist", locals: {page_title: "Students in Courses",
      course: course}
  end
  
  get :assign do
    
  end
end
