CourseOutcomes.controllers :login do
  get :index do
    render "login/login"
  end
  #def new
   # @user_session = UserSession.new
  #end
 # def create
  #  @user_session = UserSession.new(params[:user_session])
  #  if @user_session.save
  #    flash[:notice] = "Login successful!"
  #    redirect_back_or_default user_path
  #  else
  #    render :action => :new
  #  end
  #end
end
