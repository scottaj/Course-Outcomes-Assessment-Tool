###
# USER MODEL
#
# Accessor Methods
#   username   => String
#   password   => String
#   first_name => String
#   last_name  => String
#   active     => Boolean
#   role       => Symbol
#   courses    => Array of Course Model Instances
#
class User < ActiveRecord::Base
  ROLES = {user: 1, admin: 2}
  
  # Make a ".role?" method for each role defined.
  ROLES.each_key do |role| 
    define_method("#{role.to_s}?") do
      return self.role == role
    end
  end
  
  has_many :courses, dependent: :nullify, inverse_of: :professor
  
  attr_accessor :password_confirmation
  
  before_create do
    write_attribute(:active, true) unless read_attribute(:active)
    write_attribute(:role, 1) unless read_attribute(:role)
  end

  before_save do
    write_attribute(:password, BCrypt::Password.create(read_attribute(:password)))
  end
  
  validates_presence_of :username, message: "You must specify a username"
  validates_uniqueness_of :username, message: "A user with this username already exists"
  
  validates_length_of :password, minimum: 8, message: "Password must be at least 8 characters"
  validates_format_of :password, with: /^.*[a-z]+.*$/i, message: "Password must contain one or more letters"
  validates_format_of :password, with: /^.*[\d\W]+.*$/, message: "Password must contain one or more numbers or symbols"
  validates_confirmation_of :password, message: "Entered password does not match"

  validates_inclusion_of :role, within: ROLES.keys, message: "Undefined role selected"
  
  def self.authenticate(username, password)
    user = self.find_by_username_and_active(username, true)
    if user and BCrypt::Password.new(user.password) == password
      return user.id
    else
      return nil
    end
  end
  
  def name()
    return "#{self.first_name} #{self.last_name}"
  end

  def role()
    ROLES.key(read_attribute(:role))
  end

  def role=(role)
    write_attribute(:role, ROLES[role.to_sym])
  end

  def course_average()
    averages = self.courses.map {|c| c.outcome_average}.find_all {|c| c > 0}

    return averages.inject(:+) / averages.size.to_f

  rescue NoMethodError, ZeroDivisionError
    return 0
  end
  
  def courses_passing_by_average?()
    return self.course_average >= 0.7
  end

  def courses_passing_by_count?()
    return (self.courses.find_all {|c| c.passing?}.size / self.courses.size.to_f) >= 0.7

  rescue NoMethodError, ZeroDivisionError
    return false
  end
end
