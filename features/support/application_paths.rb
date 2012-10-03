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
  else
    raise "No path for string '#{path_alias}'"
  end
end
