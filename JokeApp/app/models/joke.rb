class Joke < ApplicationRecord
    has_many :votes
    has_many :users, through: :votes
    scope :random_order, -> { order(Arel.sql("RAND()")).first }
    scope :not_voted_by_user, ->(user) { where.not(id: user.votes.map(&:joke).pluck(:id)) }

    def self.random
        offset = rand(Joke.count)
        Joke.offset(offset).first
    end
end
