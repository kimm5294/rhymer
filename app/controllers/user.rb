get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user])

  if user.save
    session[:current_user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  requires_owner(params[:id])
  erb :'users/show'
end




get '/login' do
  erb :'users/login'
end

post '/login' do
  user = User.find_by(username: params[:username])

  if user && user.authenticate(params[:password])
    session[:current_user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = ["Username and Password do not match"]
    erb :'/users/login'
  end
end

post '/logout' do
  session.clear
  redirect '/'
end
