CourseOutcomes.controllers :reports do
  post :course_status, map: "reports/course/status" do
    user = User.find(session[:token])

    if user.admin?
      courses = Course.all(order: "term_year DESC, term_number DESC")
    else
      courses = user.courses(order: "term_year DESC, term_number DESC")
    end

    terms = Set.new(courses).divide {|c| c.term_year}.map {|year| year.divide{|c| c.term_number}}
                      
    partial "partials/reports/course_status", locals: {
       terms: terms
    }
  end
  
  post :user_status, map: "reports/user/status" do
    user = User.find(session[:token])
    if user.admin?
      users = User.all
    else
      users = [user]
    end
    
    partial "partials/reports/user_status", locals: {
      users: users
    }
  end

  post :program_status, map: "reports/program/status" do
    user = User.find(session[:token])
    program_outcomes = ProgramOutcome.all(order: "enum ASC")
    
    if user.admin?
      courses = Course.all(order: "term_year DESC, term_number DESC")
    else
      courses = user.courses(order: "term_year DESC, term_number DESC")
    end

    terms = Set.new(courses).divide {|c| c.term_year}.map {|year| year.divide{|c| c.term_number}}
    
    partial "partials/reports/program_outcome_status", locals: {
      terms: terms,
      program_outcomes: program_outcomes
    }
  end
end
