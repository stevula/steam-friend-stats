get '/login' do
  erb :'sessions/login'
end

post '/sessions' do
  @errors = []
  @errors << "username must not be blank" unless params[params[:username]]
  @errors << "email must not be blank" unless params[:email]
  @errors << "password must not be blank" unless params[:password]

  user = User.find_by(username: params[:username])

  if user && user.password == params[:password]
    session[:user_id] = user.id
    redirect '/'
  else
    @errors << "incorrect username or password"
    erb :'sessions/login'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end