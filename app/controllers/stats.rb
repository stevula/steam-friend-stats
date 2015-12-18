get '/stats' do
  user = SteamId.new(params[:steam_id].to_i)
  user.initialize_friends

  erb :'stats/_stats', layout: false, locals: {user: user}
end