CourseOutcomes.controllers :user, parent: :admin do
  get :create do
    render "admin/user/create", locals: {page_title: "Create New User"}
  end

  post :create do
    user = User.new(username: params[:username],
                    first_name: params[:first_name],
                    last_name: params[:last_name],
                    password: params[:password])

    if user.valid?
      user.save
      redirect "/admin/user"
    else
      redirect "/admin/admin/user/create?error=true"
    end
  end
end
