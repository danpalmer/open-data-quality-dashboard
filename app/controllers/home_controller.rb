class HomeController < ApplicationController

    def stats
        @departments = Department.all
        @extensions = Resource.select("extension").group("extension").count
        @statuses = Resource.select("http_status").group("http_status").count
        @encodings = Resource.select("encoding").group("encoding").count
    end

    def leaderboard
        @departments = Department.all
    end

end
