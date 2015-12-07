get '/login' do
  erb :'sessions/login'
end

post '/sessions' do
  user = User.find_by(username: params[:username])
  session[:user_id] = user.id if user && user.password == params[:password]

  redirect '/'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end