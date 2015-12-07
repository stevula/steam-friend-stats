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

get '/users/:id/entries' do
  if User.find_by(id: params[:id])
    @user = User.find(params[:id])
    erb :'users/entries/show'
  else
    erb :'404'
  end
end