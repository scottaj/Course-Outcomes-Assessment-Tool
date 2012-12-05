require 'spec_helper'

describe "Assignment Model" do
  let(:assignment) { Assignment.new }
  it 'can be created' do
    assignment.should_not be_nil
  end
end
