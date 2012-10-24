CourseOutcomes.controllers :assessment do
  get :index, with: :course_id do
    course = Course.find(params[:course_id])
    outcomes = Outcome.find_all_by_course_id(course.id, order: "enum DESC")
    
    render "/assessment/course", locals: {
      page_title: "#{course.course_title}-#{course.section}",
      course: course,
      outcomes: outcomes
    }
  end
end