CourseOutcomes.controllers :user, parent: :admin do

  get :index do
    user = User.find_by_username(params[:admin_id])
    errors = session[:errors] || []
    session[:errors] = nil
    render "admin/user/detail", locals: {page_title: user.name, user: user, errors: errors}
  end

  post :index do
    user = User.find_by_username(params[:admin_id])
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    unless params[:new_password].empty?
    user.password = params[:new_password]
    user.password_confirmation = params[:password_confirmation]
    end
    user.save

    session[:errors] = get_ar_errors(user)
    redirect "admin/#{params[:admin_id]}/user"
  end
  
  get :create do
    errors = session[:errors] || []
    session[:errors] = nil
    render "admin/user/create", locals: {page_title: "Create New User", errors: errors}
  end

  post :create do
    session[:errors] = nil
    user = User.new(username: params[:username],
                    first_name: params[:first_name],
                    last_name: params[:last_name],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])

    if user.valid?
      user.save
      redirect "/admin/user"
    else
      session[:errors] = get_ar_errors(user)
      redirect "/admin/admin/user/create"
    end
  end
    
  get :delete do
    user = User.find_by_username(params[:admin_id])
    if user.active == false
      user.active = true
      user.save
      redirect "/admin/user"
    else
      user.active = false
      user.save
      redirect "/admin/user"
    end
  end
    
  get :deactivated do
    deactivated = get_all_users(false)
    return partial "/partials/admin/user_table", locals: {users: deactivated}
  end
end
