def get_path(path_alias)
  case path_alias
  when /the home page/i
    "/"
  when /the login page/i
    "/login"
  end
end
