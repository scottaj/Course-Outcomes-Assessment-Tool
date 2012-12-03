CourseOutcomes.controllers :survey do
  layout :survey_layout

  before :login do
    redirect url_for(:survey, :index) if session[:student_token]
  end

  before /^(?!\/survey\/login).*$/ do
    redirect url_for(:survey, :login) unless session[:student_token]
  end
  
  get :login, map: "/survey/login" do
    render "survey/login", locals: {page_title: "Login", error: params[:error]}
  end

  post :login, map: "/survey/login" do
    student = Student.find_by_student_id(append_t_number(params[:student_id]))
    if student
      session[:student_token] = student.id
      redirect url_for(:survey, :index)
    else
      redirect url_for(:survey, :login, error: "true")
    end
  end
  
  get :index, map: "/survey/select" do
    student = Student.find(session[:student_token])
    active_surveys = student.survey_trackers.where(locked: false, complete: false)

    render "survey/index", locals: {
      page_title: "Select Survey",
      student: student,
      surveys: active_surveys
    }
  end

  get :take, map: "/survey/take", with: :course_id do
    course = Course.find(params[:course_id])
    student = Student.find(session[:student_token])
    questions = course.survey_questions

    render "survey/survey", locals: {
      page_title: course.course_title,
      course: course,
      student: student,
      questions: questions
    }
  end

  post :take, map: "/survey/take", with: :course_id do
    course = Course.find(params[:course_id])
    student = Student.find(session[:student_token])
    questions = course.survey_questions

    responses = {}
    questions.each do |q|
      responses[q] = (params[:"#{q.id}"] ? params[:"#{q.id}"] : nil)
    end
    create_responses(responses)
    update_tracker(course, student)
    
    redirect url_for(:survey, :index)
  end
end
