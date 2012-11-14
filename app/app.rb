class CourseOutcomes < Padrino::Application
  use ActiveRecord::ConnectionAdapters::ConnectionManagement
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers  

  Slim::Engine.set_default_options :pretty => true

  enable :sessions
  layout :layout

  before /^(?!\/(login|survey)).*$/i do
    redirect url_for(:login, :index) unless session[:token]
  end
  
  before /^\/admin.*$/ do
    error 403 unless User.find(session[:token]).admin?
  end

  get :index do
    redirect url_for(:homepage, :index)
  end

  error 403 do
    ## I Don't know why, but for the render call in an error block you have to put in the file extension of the template and tell it to use the layout manually.
    render "errors/403.slim", layout: :layout, locals: {page_title: "Error 403"}
  end

  error 404 do
    render "errors/404.slim", layout: :layout, locals: {page_title: "Error 404"}
  end

  error do
    halt 404 if PADRINO_ENV == :production
  end
end

