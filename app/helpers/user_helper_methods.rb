def current_user
  User.find(session[:current_user_id]) if session[:current_user_id]
end

def requires_login
  if !current_user
    redirect '/'
  end
end

def logged_in
  return true if current_user else false
end