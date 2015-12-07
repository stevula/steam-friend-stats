get '/register' do
  erb :'users/register'
end

post '/users' do
  @errors = []
  @errors << "username must be unique" if User.find_by(username: params[:username])
  @errors << "username must not be blank" unless params[params[:username]]
  @errors << "email must be unique" if User.find_by(email: params[:email])
  @errors << "email must not be blank" unless params[:email]
  @errors << "password must not be blank" unless params[:password]

  if @errors.any?
    erb :'users/register'
  else
    User.create(
      username: params[:username],
      email:    params[:email],
      password: params[:password]
      )
    redirect '/'
  end
end