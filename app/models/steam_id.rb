class SteamId
  def initialize_friends
    puts "Fetching friend data... (#{self.friends.length} friends)"

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
    # @friends comes from gem class
    @friends.length
  end

  def friend_max_friend_count
    top_friend        = ""
    max_friend_count  = 0

    puts "Counting friends' friends..."

    @friends.each do |friend|
      print "."

      begin
        friend_count = friend.friends.length

        if friend_count > max_friend_count
          top_friend = friend
          max_friend_count    = friend_count
        end
      rescue
        next
      end
    end
    puts

    return [top_friend, max_friend_count]
  end


  def most_played_game
    # #most_played_games comes from gem class and returns a hash of games and
    #   with most played as first key-value pair
    game  = self.most_played_games.keys.first
    hours = self.most_played_games.values.first

    return [game, hours]
  end

  def friend_most_played_game
    top_friend    = ""
    game          = ""
    max_play_time = 0

    puts "Calculating most played game among friends..."

    @friends.each do |friend|
      print "."

      begin
        fav_game, fav_game_time = friend.most_played_game

        if fav_game_time > max_play_time
          top_friend    = friend
          game          = fav_game
          max_play_time = fav_game_time
        end
      rescue
        next
      end
    end
    puts

    return [top_friend, game, max_play_time]
  end

  def join_date
    # returns a time object
    self.member_since
  end

  def friend_oldest_member
    eldest    = ""
    join_date = Time.now

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

    return [eldest, join_date]
  end

  def friend_newest_member
    newest    = ""
    join_date = 100.years.ago

    puts "Calculating newest Steam member among friends..."

    @friends.each do |friend|
      print "."

      begin
        if friend.join_date > join_date
          newest    = friend
          join_date = friend.join_date
        end
      rescue
        next
      end
    end

    puts

    return [newest, join_date]
  end

  def game_count
    self.games.count
  end

  def friend_most_games
    most_games_friend = ""
    game_count_max    = 0

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

    return [most_games_friend, game_count_max]
  end
end