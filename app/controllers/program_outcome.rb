CourseOutcomes.controllers :program_outcome, parent: :admin do

  get :index, map: '/admin/program_outcome', with: :enum, priority: :low do
    outcome = ProgramOutcome.find_by_enum(params[:enum])

    render "admin/program_outcome/edit", locals: {page_title: "Edit Outcome #{outcome.enum}", outcome: outcome}
  end

  post :index, map: '/admin/program_outcome', with: :enum, priority: :low do
    outcome = ProgramOutcome.find_by_enum(params[:enum])
    outcome.outcome = params[:outcome]

    outcome.save

    redirect url_for(:admin, :program, :outcomes)
  end

  get :create, map: '/admin/program_outcome/create' do
    render "admin/program_outcome/create", locals: {page_title: "Create Program Outcome"}
  end

  post :create, map: '/admin/program_outcome/create' do
    p = ProgramOutcome.new
    p.outcome = params[:outcome]

    p.save
    redirect url_for(:admin, :program, :outcomes)
  end

  get :delete, map: '/admin/program_outcome/delete', with: :enum do
    outcome = ProgramOutcome.find_by_enum(params[:enum])
    outcome.destroy

    redirect url_for(:admin, :program, :outcomes)
  end
end
