require 'spec_helper'

describe "Outcome Model" do
  let(:outcome) { Outcome.new }
  it 'can be created' do
    outcome.should_not be_nil
  end
end
