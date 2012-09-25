class CourseOutcomes < Padrino::Application
  use ActiveRecord::ConnectionAdapters::ConnectionManagement
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers

  Slim::Engine.set_default_options :pretty => true
  
  enable :sessions
  layout :layout
  
  get :index do
    render "index", locals: {page_title: "UDM COAT"}
  end
end
