CourseOutcomes.controllers :indirect_measure, parent: :assessment do

  get :index, map: "survey/admin" do
    questions = SurveyQuestion.find_all_by_courses_id(params[:assessment_id])
    course = Course.find(params[:assessment_id])

    render "assessment/indirect_measure/survey", locals: {
      page_title: "Student Survey Administration",
      questions: questions,
      course: course
    }
  end

  get :create, map: "survey/admin/question/create" do
    course = Course.find(params[:assessment_id])

    render "assessment/indirect_measure/create", locals: {
      page_title: "Create Survey Question",
      course: course
    }
  end

  post :create, map: "survey/admin/question/create" do
    question = SurveyQuestion.new

    question.question = params[:question]
    question.course = Course.find(params[:assessment_id])
    question.outcomes = params[:outcomes].map {|o| Outcome.find_by_enum(o)}

    if question.valid?
      question.save
      redirect url_for(:indirect, :measure, :index, assessment_id: params[:assessment_id])
    end
  end
end
