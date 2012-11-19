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
  
  validates_uniqueness_of :enum, scope: :course_id
  validates_presence_of :course

  before_create do
    self.enum ||= generate_enum
  end

  def generate_enum()
    max = Outcome.maximum(:enum)
    return max ? max + 1 : 1
  end
end
