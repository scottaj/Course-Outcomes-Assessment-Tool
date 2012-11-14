CourseOutcomes.controllers :survey do
  layout :survey_layout

  get :login, map: "/survey/login" do
    render "survey/login", locals: {page_title: "Login", error: params[:error]}
  end

  post :login, map: "/survey/login" do
    student = Student.find_by_student_id(params[:student_id])
    if student
      session[:student_token] = student.id
      redirect url_for(:survey, :index)
    else
      redirect url_for(:survey, :login, error: "true")
    end
  end
  
  get :index, map: "/survey/select" do
    
  end
end
