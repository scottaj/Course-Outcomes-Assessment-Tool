def get_path(path_alias)
  case path_alias
  when /the home page/i
    "/"
  when /the login page/i
    "/login"
  when /the homepage/i
    "/homepage"
  else
    raise "No path for string '#{path_alias}'"
  end
end
