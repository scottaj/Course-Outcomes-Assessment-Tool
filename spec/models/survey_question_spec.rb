require 'spec_helper'

describe "SurveyQuestion Model" do
  let(:survey_question) { SurveyQuestion.new }
  it 'can be created' do
    survey_question.should_not be_nil
  end
end
