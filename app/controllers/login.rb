CourseOutcomes.controllers :login do
  get :index do
    render "login/login", locals: {page_title: "Log In", error: params[:error]}
  end

  post :index do
    token = User.authenticate(params[:username], params[:password])

    if token
      session[:token] = token
      redirect url_for(:homepage, :index)
    else
      redirect url_for(:login, :index, error: true)#"/login?error=true"
    end
  end

  get :logout, map: "/logout" do
    session.clear
    redirect url_for(:login, :index)
  end
end
