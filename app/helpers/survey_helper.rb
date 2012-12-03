CourseOutcomes.helpers do
  def create_responses(responses)
    unless responses.include? nil
      responses.each do |question, response|
        SurveyResponse.create(question: question, response: response)
      end
      return true
    end
    return false
  end

  def update_tracker(course, student)
    tracker = course.survey_trackers.find_by_student_id(student.id)
    tracker.complete = true
    tracker.save
  end
end
