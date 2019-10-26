class ApplicationController < ActionController::Base
    protect_from_forgery unless: -> { request.format.json? }

    def current_user
        token = request.headers["Authorization"].to_s
        session = Session.find_by token: token

        session ? session.user : nil
    end
end
