CourseOutcomes.controllers :indirect_measure, parent: :assessment do

  get :index, map: "survey/admin" do
    course = Course.find(params[:assessment_id])
    questions = course.survey_questions

    render "assessment/indirect_measure/survey", locals: {
      page_title: "Student Survey Administration",
      questions: questions,
      course: course
    }
  end

  get :edit, map: "survey/admin/question/edit", with: :question_id do
    course = Course.find(params[:assessment_id])
    question = SurveyQuestion.find(params[:question_id])

    render "assessment/indirect_measure/edit", locals: {
      page_title: "Edit Survey Question",
      question: question,
      course: course
    }
  end

  post :edit, map: "survey/admin/question/edit", with: :question_id do
    question = SurveyQuestion.find(params[:question_id])
    
    question.question = params[:question]
    question.outcomes = params[:outcomes].map {|o| Outcome.find_by_enum(o)}

    if question.valid?
      question.save
      redirect url_for(:indirect, :measure, :index, assessment_id: params[:assessment_id])
    end
  end
  
  get :create, map: "survey/admin/question/create" do
    course = Course.find(params[:assessment_id])

    render "assessment/indirect_measure/create", locals: {
      page_title: "Create Survey Question",
      course: course
    }
  end

  post :create, map: "survey/admin/question/create" do
    course = Course.find(params[:assessment_id])
    question = SurveyQuestion.new

    question.question = params[:question]
    question.course = Course.find(params[:assessment_id])
    question.outcomes = params[:outcomes].map {|o| course.outcomes.find_by_enum(o)}

    if question.valid?
      question.save
      redirect url_for(:indirect, :measure, :index, assessment_id: params[:assessment_id])
    end
  end

  get :delete, map: "survey/admin/question/delete", with: :question_id do
    question = SurveyQuestion.find(params[:question_id]).destroy

    redirect url_for(:indirect, :measure, :index, assessment_id: params[:assessment_id])
  end

  get :lock, map: "survey/admin/lock" do
    course = Course.find(params[:assessment_id])

    course.survey_trackers.each do |st|
      st.locked = !st.locked
      st.save
    end

    redirect url_for(:indirect, :measure, :index, assessment_id: params[:assessment_id])
  end
end
