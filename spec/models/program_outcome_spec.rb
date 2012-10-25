require 'spec_helper'

describe "ProgramOutcome Model" do
  let(:program_outcome) { ProgramOutcome.create }
  it 'can be created' do
    program_outcome.should_not be_nil
  end

  describe "validations" do
    describe "enum" do
      it "should be an auto-generated incrementing integerthat starts at 1 if not manually specified" do
        x = []
        3.times {x << ProgramOutcome.create}

        x.map {|i| i.enum}.should =~ ['a', 'b', 'c']
      end

      it "Should be unique" do
        p = ProgramOutcome.create()
        q = ProgramOutcome.new(enum: p.enum)

        q.should_not be_valid
      end
    end
  end
end
