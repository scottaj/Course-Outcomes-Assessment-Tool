CourseOutcomes.controllers :user, parent: :admin do

  get :index, map: '/admin/user', with: :username, priority: :low do
    user = User.find_by_username(params[:username])
    errors = session[:errors] || []
    session[:errors] = nil
    render "admin/user/detail", locals: {page_title: user.name, user: user, errors: errors}
  end

  post :index, map: '/admin/user', with: :username, priority: :low do
    user = User.find_by_username(params[:username])
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    unless params[:new_password].empty?
    user.password = params[:new_password]
    user.password_confirmation = params[:password_confirmation]
    end
    user.save

    session[:errors] = get_ar_errors(user)
    redirect url_for(:user, :index, username: params[:username])
  end
  
  get :create, map: '/admin/user/create' do
    errors = session[:errors] || []
    session[:errors] = nil
    render "admin/user/create", locals: {page_title: "Create New User", errors: errors}
  end

  post :create, map: '/admin/user/create' do
    session[:errors] = nil
    user = User.new(username: params[:username],
                    first_name: params[:first_name],
                    last_name: params[:last_name],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])

    if user.valid?
      user.save
      redirect url_for(:admin, :users)
    else
      session[:errors] = get_ar_errors(user)
      redirect url_for(:user, :create)
    end
  end
    
  get :delete, map: '/admin/user/delete', with: :username do
    user = User.find_by_username(params[:username])
    user.active = !user.active
    user.save
    redirect url_for(:admin, :users)
  end
    
  get :deactivated, map: '/admin/user/deactivated' do
    deactivated = get_all_users(false)
    return partial "/partials/admin/user_table", locals: {users: deactivated}
  end
end
