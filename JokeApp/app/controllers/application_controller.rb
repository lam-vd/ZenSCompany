class ApplicationController < ActionController::Base
    before_action :set_cookie_preferences

    private

    def set_cookie_preferences
        cookies[:allow_cookies] = params[:allow_cookies] if params[:allow_cookies].present?
    end
end
