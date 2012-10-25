CourseOutcomes.controllers :student, parent: :admin do

  get :index do
    user = User.find_by_student_id(params[:student_id])
    render "admin/student"
  end

  post :index do
    student = Student.find_by_student_id(params[:student_id])
    student.first_name = params[:first_name]
    student.last_name = params[:last_name]
    student.student_id = params[:student_id]
    student.save
  end
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  
end
