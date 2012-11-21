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
end
