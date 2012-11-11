require 'spec_helper'

describe "User Model" do
  it 'can be created' do
    user = User.new
    user.should_not be_nil
  end

  describe "Creating Password" do
    it "should hash a users password when the user is saved" do
      user = User.new(username: "nortonm", role: :user)
      password = "abcd1234"
      user.password = password
      user.save
      
      user.password.should =~ /^\$[0-9a-z]{2}\$[0-9]{2}\$[A-Za-z0-9\.\/]{53}$/
    end

    it "should invalidate a password that is too short" do
      user = User.new(username: "nortonm", role: :user)
      user.password = "ab12"
      user.should_not be_valid
    end

    it "should invalidate a password that has no letters" do
      user = User.new(username: "nortonm", role: :user)
      user.password = "12345678"
      user.should_not be_valid
    end

    it "should invalidate a password that has no numbers or symbols" do
      user = User.new(username: "nortonm", role: :user)
      user.password = "abcdefgh"
      user.should_not be_valid
    end
  end

  describe "Authenticating Password" do
    it "should authenticate a user and return their token if the provided username password pair is correct" do
      u = User.create(username: "nelsonw", password: "abcd1234", role: :user)
      token = User.authenticate("nelsonw", "abcd1234")

      token.should == u.id
    end

    it "should not authenticate a user if they provide an incorrect username" do
      User.create(username: "manningp", password: "a1b2c3d4", role: :user)
      token = User.authenticate("manninge", "a1b2c3d4")
      token.should be_nil
    end

    it "should not authenticate a user if they provide an incorrect password" do
      User.create(username: "manninge", password: "abcd1234", role: :user)
      token = User.authenticate("manninge", "1234dcba")
      token.should be_nil
    end
  end

  describe "Username" do
    it "should be unique" do
      User.create(username: "crower", password: "abcd1234", role: :user)
      u = User.new(username: "crower", password: "a1b2c3d4", role: :user)
      u.should_not be_valid
    end

    it "must exist" do
      u = User.new(password: "abcd1234", first_name: "Jeff", last_name: "Daniels", role: :user)

      u.should_not be_valid
    end
  end

  describe "roles" do
    before :each do
      @u = User.new(username: "mctest",
                    password: "abcd1234")
    end
    
    it "should not accept undefined roles" do
      @u.role = :party_pooper
      @u.should_not be_valid
    end
    
    it "should say an admin is an admin" do
      @u.role = :admin
      @u.should be_admin
    end
    
    it "should say a non-admin is not an admin" do
      @u.role = :user
      @u.should_not be_admin
    end
    
    it "should say a user is an user" do
      @u.role = :user
      @u.should be_user
    end

    it "should say a non-user is not a user" do
      @u.role = :admin
      @u.should_not be_user
    end
  end
end
