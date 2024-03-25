class JokesController < ApplicationController
  def index
    user = User.find_by(cookies_user_id: cookies[:guest_user_id])
    @joke = JokeService.random_joke_for_user(user)
  end
end
