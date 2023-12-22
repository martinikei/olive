class MatchesController < ApplicationController

    def index
        @matched_users = current_user.matched_users
    end

    def delete_all_matches
        Match.destroy_all
        redirect_to '/', notice: 'All swipes deleted!'
    end

    def delete_my_matches
        Match.where(user1_id: current_user.id)
        redirect_to '/', notice: 'My matches deleted!'
    end
end

