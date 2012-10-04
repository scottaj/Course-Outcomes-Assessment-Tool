require 'bcrypt'

class User < ActiveRecord::Base

  attr_accessor :password_confirmation
  before_save do
    self.password = BCrypt::Password.create(self.password)
  end

  validates_presence_of :username, message: "You must specify a username"
  validates_length_of :password, minimum: 8, message: "Password must be at least 8 characters"
  validates_format_of :password, with: /^.*[a-z]+.*$/i, message: "Password must contain one or more letters"
  validates_format_of :password, with: /^.*[0-9\-_\(\)!@#\$%\^&\*\+=~\?`]+.*$/, message: "Password must contain one or more numbers or symbols"
  validates_uniqueness_of :username, message: "A user with this username already exists"
  validates_confirmation_of :password, message: "Entered password does not match"
  
  def self.authenticate(username, password)
    user = self.where(username: username).first
    if user and BCrypt::Password.new(user.password) == password
      return user.id
    else
      return nil
    end
  end
  
  def name()
    return "#{self.first_name} #{self.last_name}"
  end
	
	#def authentication_level()
		#user = User.find(session:token)
		#errors.add_to_base("Cannot set user level above #{user.level}")
		#if level > user.level
	#end
end
