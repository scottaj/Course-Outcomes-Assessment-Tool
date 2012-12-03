CourseOutcomes.helpers do
  def setup_trackers(course)
    enrolled = course.students
    former = course.survey_trackers.map {|st| st.student}
    new_students = enrolled - former
    removed_students = former - enrolled

    logger.info new_students
    logger.info removed_students
    
    # Add new trackers
    new_students.each do |student|
      st = SurveyTracker.new(student: student, course: course)
      st.locked = (course.survey_trackers.first ? course.survey_trackers.first.locked : true)
      st.save
    end

    # Remove old trackers
    removed_students.each do |student|
      course.survey_trackers.where(student_id: student.id).destroy_all
    end
  end
end
