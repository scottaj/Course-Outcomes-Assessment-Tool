class ProgramOutcome < ActiveRecord::Base
  has_and_belongs_to_many :outcomes, class_name: "Outcome"
end
