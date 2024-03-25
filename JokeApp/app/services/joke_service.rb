class JokeService
    def self.random_joke_for_user(user)
        user.present? ? random_joke_not_voted_by_user(user) : Joke.random
    end

    def self.random_joke_not_voted_by_user(user)
        Joke.not_voted_by_user(user).random_order
    end
end