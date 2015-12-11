module QueryHandler
  def self.count_friends(user)
    user.friends.count.to_s
  end
end