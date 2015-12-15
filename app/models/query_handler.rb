module QueryHandler
  def self.friend_count(user = SteamId.from_steam_id("STEAM_0:1:9837420"))
    user.friends.count.to_s
  end

  def self.most_played_game(user = SteamId.from_steam_id("STEAM_0:1:9837420"))
    return user.most_played_games.keys.first, user.most_played_games.values.first
  end

  def self.join_date(user = SteamId.from_steam_id("STEAM_0:1:9837420"))
    user.member_since.year
  end

  def self.friend_with_most_friends(user = SteamId.from_steam_id("STEAM_0:1:9837420"))
    most_popular_friend = ""
    friend_count_max    = 0

    user.fetch_friends.each do |friend|
      begin
        friend.fetch

        if friend.friends.count > friend_count_max
          most_popular_friend = friend
          friend_count_max    = friend.friends.count
        end
      rescue
        next
      end
    end

    return most_popular_friend, friend_count_max
  end

  def self.friend_with_most_games(user = SteamId.from_steam_id("STEAM_0:1:9837420"))
    most_games_friend = ""
    game_count_max    = 0

    user.fetch_friends.each do |friend|
      begin
        if friend.games.count > game_count_max
          most_games_friend = friend
          game_count_max    = friend.games.count
        end
      rescue
        next
      end
    end

    most_games_friend.fetch

    return most_games_friend, game_count_max
  end

  def self.oldest_member(user = SteamId.from_steam_id("STEAM_0:1:9837420"))
    eldest    = ""
    join_date = Date.today.year

    user.fetch_friends.each do |friend|
      begin
        friend.fetch
        if QueryHandler.join_date(friend) < join_date
          eldest    = friend
          join_date = QueryHandler.join_date(friend)
        end
      rescue
        next
      end
    end

    return eldest, join_date
  end

  def self.friend_most_played_game(user = SteamId.from_steam_id("STEAM_0:1:9837420"))
    addict = ""
    game   = ""
    time   = 0

    user.fetch_friends.each do |friend|
      begin
        friend.fetch
        if QueryHandler.most_played_game(friend).last.to_i > time
          addicted_friend = friend
          game = QueryHandler.most_played_game(friend)[0]
          time = QueryHandler.most_played_game(friend)[1].to_i
        end
      rescue
        next
      end
    end

    return addict, game, time
  end
end