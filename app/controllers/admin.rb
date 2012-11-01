CourseOutcomes.controllers :admin do
  get :index do
    render "admin/admin", locals: {page_title: "Admin"}
  end

  get :user do
    deactivated = get_all_users(true)
    render "admin/user/user", locals: {page_title: "User Administration", users: deactivated}
  end

  get :courses do
    courses = get_all_courses(false)
    
    render "admin/courses", locals: {page_title: "Course Administration", courses: courses}
  end
  
  get :students do
    render "admin/student", locals: {page_title: "Students"}
  end

  get :program_outcomes do
    program_outcomes = ProgramOutcome.all(order: "enum Asc")
    
    render "admin/program_outcomes", locals: {page_title: "Program Outcomes Administration", outcomes: program_outcomes}
  end

  get :program_outcomes, with: [:enum, :direction] do
    move_to = case params[:direction]
              when /up/i
                get_previous_outcome(params[:enum])
              when /down/i
                get_next_outcome(params[:enum])
              else
                nil
              end

    unless move_to.nil?
      moving = ProgramOutcome.find_by_enum(params[:enum])
      moving.outcome, move_to.outcome = move_to.outcome, moving.outcome

      moving.save
      move_to.save
    end
    redirect "admin/program_outcomes"
  end
end
