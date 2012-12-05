##
# OUTCOME MODEL
#
# Accessor Methods:
#   id               => Integer primary key
#   enum             => Integer, default: 1 or max existing enum plus 1
#   outcome          => Text
#   course           => Course Model Instance
#   program_outcomes => Array of ProgramOutcome Model Instances
#
class Outcome < ActiveRecord::Base
  belongs_to :course, class_name: "Course", foreign_key: "course_id", inverse_of: :outcomes
  has_and_belongs_to_many :program_outcomes, class_name: "ProgramOutcome"
  has_and_belongs_to_many :survey_questions, class_name: "SurveyQuestion"
  has_and_belongs_to_many :assignments, class_name: "Assignment"
  
  validates_uniqueness_of :enum, scope: :course_id
  validates_presence_of :course

  before_create do
    self.enum ||= generate_enum
  end

  def generate_enum()
    max = Outcome.maximum(:enum)
    return max ? max + 1 : 1
  end

  def outcome_average()
    all_assignment_pcts = self.assignments.map {|assn| (assn.number_passing or -1) / assn.course.students.size.to_f}.find_all {|x| x > 0}

    direct_measure_average = all_assignment_pcts.inject(:+) / all_assignment_pcts.size.to_f

    all_survey_responses = self.survey_questions.map {|q| q.responses.map {|r| r.response}}.flatten

    unless all_survey_responses.empty?
      indirect_measure_average = all_survey_responses.find_all {|r| r >= 3}.size / all_survey_responses.size.to_f
    
      return direct_measure_average * 0.75 + indirect_measure_average * 0.25
    end

    return direct_measure_average # If surveys aren't set up yet, only use direct measures for the average

  rescue NoMethodError, ZeroDivisionError
    return 0 # This will trigger if assignments and/or surveys aren't ready to be evaluated yet
  end
  
  # Determine if an outcome is passing based on Dr. Daimi's algorithm
  def passing?()
    return self.outcome_average >= 0.7
  end
end

