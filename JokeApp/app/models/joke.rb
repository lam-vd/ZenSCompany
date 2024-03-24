class Joke < ApplicationRecord
    def self.random
        offset = rand(Joke.count)
        Joke.offset(offset).first
    end
end
