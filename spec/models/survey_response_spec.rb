require 'spec_helper'

describe "SurveyResponse Model" do
  let(:survey_response) { SurveyResponse.new }
  it 'can be created' do
    survey_response.should_not be_nil
  end
end
