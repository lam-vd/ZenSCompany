class VoteService

    def self.find_or_create_guest_user(cookies)
        guest_user_id = cookies[:guest_user_id]
        return User.find_or_create_by(cookies_user_id: guest_user_id) if guest_user_id.present?
        guest_user = create_guest_user
        cookies[:guest_user_id] = { value: guest_user.cookies_user_id, expires: 1.days.from_now}
        guest_user
    end

    def create_guest_user
        guest_email = "guest_#{SecureRandom.hex(4)}@gmail.com"
        guest_user = User.new(email: guest_email, password: Devise.friendly_token[0, 10])
        guest_user.save ? guest_user : nil
    end
end