CourseOutcomes.controllers :student do

  get :index do
    student = Student.find_by_student_id(params[:student_id])
    render "admin/student", locals: {page_title: "Students List"}
  end

  post :index do
    student = Student.find_by_student_id(params[:student_id])
    student.first_name = params[:first_name]
    student.last_name = params[:last_name]
    student.student_id = params[:student_id]
    student.save
  end
  
  get :create do
    render "student/create", locals: {page_title: "New Student"}
  end
  
  post :create do
  #session[:errors] = nil
    student = Student.new(first_name: params[:first_name],
                          last_name: params[:last_name],
                          student_id: params[:student_id])
    if student.valid?
			student.save
			redirect "admin/students"
		end
  end
	
	get :edit do
		student = Student.find_by_student_id(params[:student_id])
		render "student/edit"
	end
	
	post :edit do
		student = Student.find_by_student_id(params[:student_id])
		
		student.first_name = params[:first_name]
		student.last_name = params[:last_name]
		student.student_id = params[:student_id]
		
		if student.valid?
			student.save
			redirect "admin/students"
		end
		
	end
	
end
