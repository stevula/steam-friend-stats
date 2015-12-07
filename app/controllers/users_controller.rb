get '/register' do
  erb :'users/register'
end

post '/users' do
  @user = User.create(
      username: params[:username],
      email:    params[:email],
      password: params[:password]
      )

  if @user.save
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/register'
  end
end