class HomeController < ApplicationController

    def stats
        @departments = Department.all
    end

    def leaderboard
        @departments = Department.all
    end

end
