CourseOutcomes.controllers :student, parent: :admin do

  get :index, map: '/admin/student', with: :id do
    errors = session[:errors] || []
    session[:errors] = nil
    student = Student.find(params[:id])
    render "student/edit", locals: {page_title: "Edit Student", student: student, errors: errors}
  end

  post :index, map: '/admin/student', with: :id do
    logger.info append_t_number(params[:id])
    student = Student.find(params[:id])
    
    student.first_name = params[:first_name]
    student.last_name = params[:last_name]
    student.student_id = append_t_number(params[:student_id])
    
    if student.valid?
      student.save
      redirect url_for(:admin, :students)
    else
      session[:errors] = get_ar_errors(student)
      redirect url_for(:student, :index, id: params[:id])
    end
  end
  
  get :create, map: '/admin/student/create', priority: :high do
    errors = session[:errors] || []
    session[:errors] = nil
    render "student/create", locals: {page_title: "New Student", errors: errors}
  end
  
  post :create, map: '/admin/student/create', priority: :high do
    student = Student.new(first_name: params[:first_name],
                          last_name: params[:last_name],
                          student_id: append_t_number(params[:student_id]))
    if student.valid?
      student.save
      redirect url_for(:admin, :students)
    else
      session[:errors] = get_ar_errors(student)
      redirect url_for(:student, :create)
    end
  end
end
