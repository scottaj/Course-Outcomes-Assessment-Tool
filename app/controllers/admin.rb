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

  get :program_outcomes do
    program_outcomes = ProgramOutcome.all(order: "enum Asc")
    
    render "admin/program_outcomes", locals: {page_title: "Program Outcomes Administration", outcomes: program_outcomes}
  end
end
