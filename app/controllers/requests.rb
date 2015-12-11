post '/requests' do
  query = params[:query]
  steam_id = SteamId.community_id_to_steam_id(params[:communityID].to_i)
  user = SteamId.from_steam_id(steam_id)

  QueryHandler.send(query, user)
end