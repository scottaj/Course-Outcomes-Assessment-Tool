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

  get :move, map: "outcome/move", with: [:enum, :direction] do
    moving = Outcome.find_by_enum(params[:enum])
    move_to = case params[:direction]
              when /up/i
                get_previous_outcome(moving)
              when /down/i
                get_next_outcome(moving)
              else
                nil
              end
    
    unless move_to.nil?
      moving.enum, move_to.enum = move_to.enum, moving.enum
      
      moving.save(validate: false)
      move_to.save
    end
    redirect url_for(:assessment, :index, course_id: params[:assessment_id])
  end
end



