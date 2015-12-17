get '/stats' do
  user = SteamId.new(params[:steam_id].to_i)

  erb :'stats/_stats', layout: false, locals: {user: user}
end