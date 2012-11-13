require 'spec_helper'

describe "SurveyTracker Model" do
  let(:survey_tracker) { SurveyTracker.new }
  it 'can be created' do
    survey_tracker.should_not be_nil
  end
end
