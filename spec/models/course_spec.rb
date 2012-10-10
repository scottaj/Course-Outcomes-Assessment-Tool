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

  describe "validation" do
    describe "required fields" do

      before :each do
        User.create(username: "willisb",
                    first_name: "Bruce",
                    last_name: "Willis",
                    password: "abcd1234")
        @course = Course.new(course_title: "AK 470",
                             course_name: "Advanced Balding",
                             term_number: 1,
                             term_year: 2012,
                             professor: User.find_by_username("willisb"))
      end
    
      it "should require a course name" do
        @course.should be_valid
        @course.course_name = nil
        @course.should_not be_valid
      end

      it "should require a course title" do
        @course.should be_valid
        @course.course_title = nil
        @course.should_not be_valid
      end

      it "should require a term number" do
        @course.should be_valid
        @course.term_number = nil
        @course.should_not be_valid
      end

      it "should require a term year" do
        @course.should be_valid
        @course.term_year = nil
        @course.should_not be_valid
      end

      it "should require a professor" do
        @course.should be_valid
        @course.professor = nil
        @course.should_not be_valid
      end
    end
  end
end
