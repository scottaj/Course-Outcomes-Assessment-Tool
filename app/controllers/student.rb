CourseOutcomes.controllers :student do

  get :index do
    student = Student.find_by_student_id(params[:student_id])
    errors = session[:errors] || []
    session[:errors] = nil
    render "admin/student", locals: {page_title: "Students List", errors:session[:errors]}
  end

  post :index do
    student = Student.find_by_student_id(params[:student_id])
    student.first_name = params[:first_name]
    student.last_name = params[:last_name]
    unless params[:student_id].empty?
    student.student_id = params[:student_id]
    end
    student.save
    
    session[:errors] = get_ar_errors(student)
    redirect "admin/student"
  end
  
  get :create do
    errors = session[:errors] || []
    session[:errors] = nil
    render "student/create", locals: {page_title: "New Student", errors:errors}
  end
  
  post :create do
  #session[:errors] = nil
  params[:student_id] = append_t_number(params[:student_id])
    student = Student.new(first_name: params[:first_name],
                          last_name: params[:last_name],
                          student_id: params[:student_id])
    if student.valid?
			student.save
			redirect "admin/students"
    else
      session[:errors] = get_ar_errors(student)
      redirect "student/create"
		end
  end
	
	get :edit do
  errors = session[:errors] || []
  session[:errors] = nil
		student = Student.find_by_student_id(params[:student_id])
		render "student/edit", locals: {page_title: "Edit Student", student: student, errors: errors}
	end
	
	post :edit do
  params[:student_id] = append_t_number(params[:student_id])
  session[:errors] = nil
		student = Student.find(params[:id])
    old_id = student.student_id
		
		student.first_name = params[:first_name]
		student.last_name = params[:last_name]
		student.student_id = params[:student_id]
		
		if student.valid?
			student.save
			redirect "admin/students"
    else
     session[:errors] = get_ar_errors(student)
     redirect "/student/edit?student_id=#{old_id}"
		end
		
	end
	
end
