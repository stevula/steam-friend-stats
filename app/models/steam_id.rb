# me = SteamId.from_steam_id("STEAM_0:1:9837420")

class SteamId
  def initialize_friends
    puts "Fetching friend data..."

    self.friends.each do |friend|
      print "."
      begin
        friend.fetch
      rescue
        next
      end
    end

    puts
  end

  def friend_count
    @friends.length
  end

  def friend_max_friend_count
    most_popular_friend = ""
    max_friend_count    = 0

    puts "Counting friends' friends..."

    @friends.each do |friend|
      print "."

      begin
        friend_count = friend.friends.length

        if friend_count > max_friend_count
          most_popular_friend = friend
          max_friend_count    = friend_count
        end
      rescue
        next
      end
    end

    puts

    return [most_popular_friend.nickname, max_friend_count]
  end

  def most_played_game
    game  = self.most_played_games.keys.first
    hours = self.most_played_games.values.first

    return [game, hours]
  end

  def friend_most_played_game
    addict        = ""
    game          = ""
    max_play_time = 0

    puts "Calculating most played game among friends..."

    @friends.each do |friend|
      print "."

      begin
        fav_game, fav_game_time = friend.most_played_game

        if fav_game_time > max_play_time
          addict        = friend
          game          = fav_game
          max_play_time = fav_game_time
        end
      rescue
        next
      end
    end

    puts "User: #{addict}"
    puts "Game: #{game}"
    puts "Time: #{max_play_time}"

    return [addict.nickname, game, max_play_time]
  end

  def join_date
    self.member_since.year
  end

  def friend_oldest_member
    eldest    = ""
    join_date = Date.today.year

    puts "Calculating oldest Steam member among friends..."

    @friends.each do |friend|
      print "."

      begin
        if friend.join_date < join_date
          eldest    = friend
          join_date = friend.join_date
        end
      rescue
        next
      end
    end

    puts

    return [eldest.nickname, join_date]
  end

  def game_count
    self.games.count
  end

  def friend_most_games
    most_games_friend = ""
    game_count_max    = 0
3
    puts "Searching through friends' games..."

    @friends.each do |friend|
      print "."

      begin
        if friend.game_count > game_count_max
          most_games_friend = friend
          game_count_max    = friend.game_count
        end
      rescue
        next
      end
    end

    puts

    return [most_games_friend.nickname, game_count_max]
  end
end