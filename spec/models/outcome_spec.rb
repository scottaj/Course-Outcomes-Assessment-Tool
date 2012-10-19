require 'spec_helper'

describe "Outcome Model" do
  before do
    @p = User.create(username: "norrisc",
                    first_name: "Chuck",
                    last_name: "Norris",
                    password: "abcd1234")
    @c = Course.create(course_name: "Roundhouse Kicking",
                      course_title: "AK 101",
                      term_number: 1,
                      term_year: 2012,
                      professor: User.find_by_username("norrisc"))
  end

  it 'can be created' do
    outcome = Outcome.new
    outcome.should_not be_nil
  end

  describe "validations" do
    describe "enum" do
      it "should be unique between two outcomes with the same course id" do
        o = Outcome.create(enum: "a",                     
                           course: @c)

        o2 = Outcome.new(enum: "a",
                         course: @c)

        o2.should_not be_valid
      end

      it "can be the same if two outcomes have different course id's" do
        o = Outcome.create(enum: "a",                     
                           course: @c)
        o2 = Outcome.new(enum: "a",
                         course_id: 999)

        o2.should be_valid
      end

      it "should be an auto-generated incrementing string if not manually specified" do
        x = []
        3.times {x << Outcome.create(course: @c)}

        x.map {|i| i.enum}.should =~ ["a", "b", "c"]
      end
    end
  end
end
