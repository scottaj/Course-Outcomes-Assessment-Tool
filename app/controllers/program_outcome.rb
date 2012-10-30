CourseOutcomes.controllers :program_outcome, parent: :admin do
  get :create do
    render "admin/program_outcome/create", locals: {page_title: "Create Program Outcome"}
  end

  post :create do
    p = ProgramOutcome.new
    p.outcome = params[:outcome]

    p.save
    redirect "/admin/program_outcomes"
  end

  get :edit, with: :enum do
    outcome = ProgramOutcome.find_by_enum(params[:enum])

    render "admin/program_outcome/edit", locals: {page_title: "Edit Outcome #{outcome.enum}", outcome: outcome}
  end

  post :edit, with: :enum do
    outcome = ProgramOutcome.find_by_enum(params[:enum])
    outcome.outcome = params[:outcome]

    outcome.save

    redirect "/admin/program_outcomes"
  end

  get :delete, with: :enum do
    outcome = ProgramOutcome.find_by_enum(params[:enum])
    outcome.destroy

    redirect "/admin/program_outcomes"
  end
end
