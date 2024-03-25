class VotesController < ApplicationController

    def create
        user = VoteService.find_or_create_guest_user(cookies)
        @vote = user.votes.new(joke_id: params[:joke_id], vote_type: params[:vote_type])
        @vote.save
        redirect_to root_path, notice: "Thank you for voting!"
    end
end  