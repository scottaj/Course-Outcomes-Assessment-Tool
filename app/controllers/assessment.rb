CourseOutcomes.controllers :assessment do
  before do
    if params[:course_id]
      halt 403 unless Course.find(params[:course_id]).professor == User.find(session[:token])
    end
  end

  get :index, with: :course_id do
    course = Course.find(params[:course_id])
    outcomes = Outcome.find_all_by_course_id(course.id, order: "enum DESC")
    
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
