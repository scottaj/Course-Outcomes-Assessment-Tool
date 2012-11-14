def get_path(path_alias, attr = nil)
  case path_alias
  when /the home page/i
    "/"
  when /the login page/i
    "/login"
  when /the homepage/i
    "/homepage"
  when /the admin(istration)? page/i
    "/admin"
  when /the user admin(istration)? page/i
    "/admin/users"
  when /the add user page/i
    "/admin/user/create"
  when /the edit user page/i
    "/admin/user"
  when /the course administration page/i
    "/admin/courses"
  when /the course creation page/i
    "/admin/course/create"
  when /the edit course page/i
    "/admin/course"
  when /the course assessment page/i
    "/assessment"
  when /the students page/i
    "/admin/students"
  when /the edit students page/i
    "/admin/student"
  when /the student creation page/i
    "/admin/student/create"
  when /the program outcome administration page/i
    "/admin/program_outcomes"
  when /the new program outcome page/i
    "/admin/program_outcome/create"
  when /the edit program outcome page/i
    "/admin/program_outcome"
  when /the student survey login page/i
    "/survey/login"
  when /the student survey selection page/i
    "/survey/select"
  else
    raise "No path for string '#{path_alias}'"
  end
end
