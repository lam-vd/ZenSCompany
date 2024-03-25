class VotesController < ApplicationController

    def create
        joke = Joke.find_by(id: params[:joke_id])
        user = current_user || guest_user
        @vote = user.votes.new(joke_id: params[:joke_id], vote_type: params[:vote_type])
        @vote.save
        redirect_to root_path, notice: "Thank you for voting!"
    end

    private
    def guest_user
        guest_user_id = cookies[:guest_user_id]
        if guest_user_id.present?
            User.find_or_create_by(cookies_user_id: guest_user_id)
        else
            guest_user = create_guest_user
            cookies[:guest_user_id] = { value: guest_user.cookies_user_id, expires: 1.days.from_now }
            guest_user
        end
    end

    def create_guest_user
        guest_email = "guest_#{SecureRandom.hex(4)}@gmail.com"
        guest_user = User.new(email: guest_email, password: Devise.friendly_token[0, 20])
        guest_user.save ? guest_user : nil
    end
end  