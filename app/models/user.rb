class User < ActiveRecord::Base
  has_many :entries, foreign_key: :author_id
  validates :username, presence: true, uniqueness: true
  validates :email,    presence: true, uniqueness: true
  validates :password, presence: true
end
