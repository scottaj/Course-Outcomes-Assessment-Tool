CourseOutcomes.controllers :admin do
  get :index do
    render "admin/admin", locals: {page_title: "Admin"}
  end

  get :user do
    render "admin/user/user", locals: {page_title: "User Administration"}
  end
end
