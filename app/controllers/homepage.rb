CourseOutcomes.controllers :homepage do
  get :index do
    courses = Course.find_all_by_user_id_and_archived(session[:token], false)
    render "homepage/homepage", locals: {courses:courses}
  end
end
