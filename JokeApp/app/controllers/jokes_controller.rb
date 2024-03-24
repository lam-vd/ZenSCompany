class JokesController < ApplicationController
  before_action :set_joke, only: %i[ show like dislike ]

  def index
    @joke = Joke.random
  end

  def show
  end

  def like
    @joke.likes += 1

    respond_to do |format|
      if @joke.save
        flash.now[:success] = "Like created successfully!"
      else
        flash.now[:error] = "Failed to create like."
      end
    end
  end

  def dislike
    @joke.dislikes += 1
    @joke.save
    redirect_to root_path
  end
  private
    def set_joke
      @joke = Joke.find_by(id: params[:id])
    end
end
