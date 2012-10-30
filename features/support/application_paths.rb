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
    "/admin/user"
  when /the add user page/i
    "/admin/admin/user/create"
  when /the edit user page/i
    "/admin/#{attr}/user"
  when /the course administration page/i
    "/admin/courses"
  when /the course creation page/i
    "/course/create"
  when /the edit course page/i
    "/course/detail"
  when /the course assessment page/i
    "/assessment"
  when /the program outcome administration page/i
    "/admin/program_outcomes"
  when /the new program outcome page/i
    "/admin/admin/program_outcome/create"
  when /the edit program outcome page/i
    "/admin/admin/program_outcome/edit/"
  else
    raise "No path for string '#{path_alias}'"
  end
end
