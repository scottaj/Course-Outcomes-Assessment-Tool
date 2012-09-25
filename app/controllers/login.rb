CourseOutcomes.controllers :login do
  get :index do
    render "login/login", locals: {page_title: "Log In", error: params[:error]}
  end

  post :index do
    token = User.authenticate(params[:username], params[:password])

    if token
      session[:token] = token
      redirect "/homepage"
    else
      redirect "/login?error=true"
    end
  end
end
