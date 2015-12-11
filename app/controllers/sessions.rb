get '/login' do
  erb :'sessions/login'
end

post '/sessions' do
  user = User.find_by(username: params[:username])

  if user && user.password == params[:password]
    session[:user_id] = user.id
    redirect '/'
  else
    @error = "incorrect username or password"
    erb :'sessions/login'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end