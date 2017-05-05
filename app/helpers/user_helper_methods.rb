def current_user
  User.find(session[:current_user_id]) if session[:current_user_id]
end

def requires_login
  if !current_user
    redirect '/'
  end
end

def logged_in
  if current_user
    return true
  else
    return false
  end
end

def requires_owner(owner_id)
  if owner_id.to_i == session[:current_user_id].to_i
    puts "correct"
  else
    redirect '/login'
  end
end
