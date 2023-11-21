class MatchesController < ApplicationController

    def index
        @matches = Match.all
    end

    def delete_all_matches
        Match.destroy_all
        redirect_to '/', notice: 'All swipes deleted!'
      end
end

