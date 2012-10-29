require 'spec_helper'

describe "ProgramOutcome Model" do
  let(:program_outcome) { ProgramOutcome.new }
  it 'can be created' do
    program_outcome.should_not be_nil
  end

  describe "validations" do
    describe "enum" do
      it "should be an auto-generated incrementing alphabetic string that starts at 'a' if not manually specified" do
        x = []
        3.times {x << ProgramOutcome.create(outcome: "#{rand}")}

        x.map {|i| i.enum}.should =~ ['a', 'b', 'c']
      end

      it "Should be unique" do
        p = ProgramOutcome.create(outcome: "")
        q = ProgramOutcome.new(enum: p.enum, outcome: "")

        q.should_not be_valid
      end
    end
    describe "outcome" do
      it "Must exist" do
        p = ProgramOutcome.new
        p.should_not be_valid
      end
    end
  end
end
