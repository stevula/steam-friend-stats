# me = SteamId.from_steam_id("STEAM_0:1:9837420")

class SteamId
  def friend_count
    puts "Calculating user friend count..."

    self.friends.count.to_s
  end

  def friend_with_most_friends
    most_popular_friend = ""
    friend_count_max    = 0

    puts "Counting friends' friends..."
    self.fetch_friends.each do |friend|
      print "."
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
    puts

    return most_popular_friend, friend_count_max
  end

  def most_played_game
    puts "Calculating most played game..."

    return self.most_played_games.keys.first, self.most_played_games.values.first
  end

  def friend_most_played_game
    addict = ""
    game   = ""
    time   = 0

    puts "Calculating most played game among friends..."
    self.fetch_friends.each do |friend|
      print "."
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
    puts

    return addict, game, time
  end

  def join_date
    self.member_since.year
  end

  def oldest_member
    eldest    = ""
    join_date = Date.today.year

    puts "Calculating oldest Steam member among friends..."
    self.fetch_friends.each do |friend|
      print "."
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
    puts

    return eldest, join_date
  end

  def game_count
    puts "Calculating user game count..."

    self.games.count.to_s
  end

  def friend_with_most_games
    most_games_friend = ""
    game_count_max    = 0

    puts "Searching through friends' games..."
    self.fetch_friends.each do |friend|
      print "."
      begin
        if friend.games.count > game_count_max
          most_games_friend = friend
          game_count_max    = friend.games.count
        end
      rescue
        next
      end
    end
    puts

    most_games_friend.fetch

    return most_games_friend, game_count_max
  end
end