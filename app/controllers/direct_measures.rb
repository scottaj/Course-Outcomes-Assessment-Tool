CourseOutcomes.controllers :direct_measures, parent: :assessment do
  get :index, map: "assignments" do
    course = Course.find(params[:assessment_id])
    top_level_assignments = course.assignments.where(assignment_id: nil)
    
    render "assessment/direct_measure/assignments", locals: {
      page_title: "Assignments",
      course: course,
      top_level_assignments: top_level_assignments
    }
  end

  get :create, map: "assignments/create" do
    course = Course.find(params[:assessment_id])

    render "assessment/direct_measure/select", locals: {
      page_title: "Select Assignment Type",
      course: course
    }
  end

  get :create, map: "assignments/create", with: :type do
    course = Course.find(params[:assessment_id])
    template = case params[:type]
               when "normal"
                 "create_normal"
               when "multi"
                 "create_multi"
               when "component"
                 "create_component"
               else
                 halt 404
               end

    render "assessment/direct_measure/#{template}", locals: {
      page_title: "Create Assignment",
      course: course
    }
  end

  post :create, map: "assignments/create", with: :type do
    course = Course.find(params[:assessment_id])
    assn = Assignment.new(course: course)

    case params[:type]
    when "normal"
      assn.name = params[:assignment_name]
      assn.description = params[:assignment_description]
      assn.outcomes = params[:outcomes].map {|o| course.outcomes.find_by_enum(o)}
    when "multi"
      assn.name = params[:assignment_name]
      assn.description = params[:assignment_description]
    when "component"
      assn.parent = Assignment.find(params[:parent_assignment])
      assn.name = params[:component_name]
      assn.outcomes = params[:outcomes].map {|o| course.outcomes.find_by_enum(o)}
    else
      halt 404
    end

    if assn.valid?
      assn.save
    end

    redirect url_for(:direct, :measures, :index, assessment_id: course.id)
  end

  get :edit, map: "assignment/edit", with: :assignment do
    course = Course.find(params[:assessment_id])
    assignment = Assignment.find(params[:assignment])

    template = "edit_normal"
    if not assignment.parts.empty?
      template = "edit_multi"
    elsif assignment.parent
      template = "edit_component"
    end

      render "assessment/direct_measure/#{template}", locals: {
        page_title: "Edit #{assignment.name}",
        course: course,
        assignment: assignment
      }
  end

  post :edit, map: "assignment/edit", with: :assignment do
    course = Course.find(params[:assessment_id])
    assignment = Assignment.find(params[:assignment])

    if not assignment.parts.empty?
      assignment.name = params[:assignment_name]
      assignment.description = params[:assignment_description]
    elsif assignment.parent
      assignment.parent = Assignment.find(params[:parent_assignment])
      assignment.name = params[:component_name]
      assignment.outcomes = params[:outcomes].map {|o| Outcome.find_by_enum(o)}
    else
      assignment.name = params[:assignment_name]
      assignment.description = params[:assignment_description]
      assignment.outcomes = params[:outcomes].map {|o| Outcome.find_by_enum(o)}      
    end

    assignment.save
    redirect url_for(:direct, :measures, :index, assessment_id: course.id)
  end
  
  get :delete, map: "assignment/delete", with: :assignment do
    Assignment.find(params[:assignment]).destroy
    redirect url_for(:direct, :measures, :index, assessment_id: params[:assessment_id])
  end

  get :evaluate, map: "assignment/evaluate", with: :assignment do
    course = Course.find(params[:assessment_id])
    assignment = Assignment.find(params[:assignment])

    render "assessment/direct_measure/evaluate", locals: {
      page_title: "Evaluate #{assignment.name}",
      course: course,
      assignment: assignment
    }
  end

  post :evaluate, map: "assignment/evaluate", with: :assignment do
    assignment = Assignment.find(params[:assignment])

    if assignment.parts.empty?
      assignment.number_passing = params[:passing]
      assignment.save
    else
      params.find_all {|p, v| p.match(/^passing\-\d+$/i)}.each do |p, v|
        a = Assignment.find(p.split('-')[1])
        a.number_passing = v
        a.save
      end
    end

    redirect url_for(:direct, :measures, :index, assessment_id: params[:assessment_id])
  end
end

