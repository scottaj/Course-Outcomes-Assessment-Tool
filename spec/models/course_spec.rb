require 'spec_helper'

describe "Course Model" do
  it 'can be created' do
    course = Course.new
    course.should_not be_nil
  end

  describe "relation to professor" do
    it "should set user_id to nil if the associated professor is deleted" do
      User.create(username: "norrisc",
                  first_name: "Chuck",
                  last_name: "Norris",
                  password: "9876zyxw")
      course = Course.create(course_title: "MMA 101",
                             course_name: "Roundhouse Kicking",
                             term_number: 1,
                             term_year: 2012,
                             professor: User.find_by_username("norrisc"))

      course.user_id.should_not be_nil
      User.find_by_username("norrisc").destroy
      course.reload.user_id.should be_nil
    end
  end
end
