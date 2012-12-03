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
  
  get :assign, with: :course_id do
    course = Course.find(params[:course_id])
    
    render "/assessment/assign", locals: {page_title: "Student Assignment", course: course}
  end
  
  get :all_students, with: [:course_id, :in] do
    if params[:in] == "in"
      students = Course.find(params[:course_id]).students
    else
      students = Student.all
    end

    json_data = students.map do |student|
      {value: student.student_id, content: "#{student.last_name}, #{student.first_name}" }
    end
  
    json_data = JSON::dump(json_data)
    
    content_type "text/json"
    return json_data
  end
  
  post :assign, with: :course_id do
    course = Course.find(params[:course_id])
    params[:students] ||= []
    
    students = params[:students].map do |student|
      Student.find_by_student_id(student)
    end
    
    course.students = students
    course.save

    setup_trackers(course)
  end
end
