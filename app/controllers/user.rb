CourseOutcomes.controllers :user, parent: :admin do
  get :create do
    session[:errors] ||= []
    errors = session[:errors]
    session[:errors] = nil
    render "admin/user/create", locals: {page_title: "Create New User", errors: errors}
  end

  post :create do
    session[:errors] = nil
    user = User.new(username: params[:username],
                    first_name: params[:first_name],
                    last_name: params[:last_name],
                    password: params[:password])

    if user.valid?
      user.save
      redirect "/admin/user"
    else
      session[:errors] = user.errors.messages.map{|e, v| v}.flatten
      redirect "/admin/admin/user/create"
    end
  end

  get :delete do
    logger.info params[:user_id]
    User.destroy_all(username: params[:admin_id])
    redirect "/admin/user"
  end
end
