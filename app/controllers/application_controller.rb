class ApplicationController < ActionController::Base
    def current_user
        token = request.headers["Authorization"].to_s
        session = Session.find_by token: token

        return session ? session.user : {}
    end
end
