class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :joke

  enum vote_type: {
    like: 0,
    dislike: 1,
  }
end