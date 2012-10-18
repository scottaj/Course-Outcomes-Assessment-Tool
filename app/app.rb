class CourseOutcomes < Padrino::Application
  use ActiveRecord::ConnectionAdapters::ConnectionManagement
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers
  

  Slim::Engine.set_default_options :pretty => true
  
  enable :sessions
  layout :layout
  
  get :index do
    redirect "/homepage"
  end
  
  before /^(?!\/(login)).*$/i do
    redirect '/login' unless session[:token]
  end
  
  get '/logout' do
    session.clear
    redirect '/login'
  end
end

