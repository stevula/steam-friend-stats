get '/stats' do
  steam_id = SteamId.community_id_to_steam_id(params[:communityID].to_i)
  user = SteamId.from_steam_id(steam_id)

  erb :'stats/_stats', layout: false, locals: {user: user}
end