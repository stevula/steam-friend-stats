module QueryHandler
  def self.friend_count(user)
    user.friends.count.to_s
  end

  def self.most_played_game(user)
    user.most_played_games.keys.first
  end

  def self.join_date(user)
    user.member_since.year
  end

  def self.friend_with_most_friends(user)
    most_popular = user.fetch_friends.each do |friend|
      p friend.friends.count
    end

    # return most_popular, most_popular.friend_count
  end
end