class HomeController < ApplicationController

    def stats
        @departments = Department.all
        @extensions = Resource.select("extension").group("extension").count
        @statuses = Resource.select("http_status").group("http_status").count
        @encodings = Resource.select("encoding").group("encoding").count
        @csvs = {
            valid: Resource.where(csv_is_valid: true).count,
            invalid: Resource.where(csv_is_valid: false).count,
            # nice_headings: Resource.where(csv_has_valid_headings: true).count,
            # awful_headings: Resource.where(csv_has_valid_headings: false).count,
            average_rows: Resource.where(extension: "csv").average("csv_rows").to_i,
        }
    end

    def leaderboard
        @departments = Department.all
        @extensions = Resource.select("extension").group("extension").count
        @statuses = Resource.select("http_status").group("http_status").count
        @encodings = Resource.select("encoding").group("encoding").count
    end

end
