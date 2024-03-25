class JokesController < ApplicationController
  def index
    user = User.find_by(cookies_user_id: cookies[:guest_user_id])
    @joke = user.present? ? Joke.not_voted_by_user(user).random_order : Joke.random
  end
end
