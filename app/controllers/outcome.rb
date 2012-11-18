CourseOutcomes.controllers :outcome, parent: :assessment do
  get :create, map: "outcome/create" do
    course = Course.find(params[:assessment_id])
    program_outcomes = ProgramOutcome.all

    render 'assessment/outcome/create', locals: {page_title: "Create Outcome", program_outcomes: program_outcomes, course: course}
  end

  post :create, map: "outcome/create" do
    course = Course.find(params[:assessment_id])

    outcome = Outcome.new(outcome: params[:outcome])
    params[:program_outcomes].each {|po| outcome.program_outcomes << ProgramOutcome.find_by_enum(po)}
    outcome.course = course

    if outcome.valid?
      outcome.save
      redirect url_for(:assessment, :index, course_id: course.id)
    end
  end
end
