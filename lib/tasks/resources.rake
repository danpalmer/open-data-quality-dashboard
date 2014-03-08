require 'open-uri'
require 'json'

namespace "import" do

    desc "Find all Resource URIs"
    task :resources => :environment do
        Resource.destroy_all
        Department.all.each do |department|
            begin
                if department.publishes_as.blank?
                    next
                end
                puts "> #{department.name}"
                dept_json = open("http://data.gov.uk/api/3/action/publisher_show?id=#{department.publishes_as}")
                dept = JSON.load(dept_json)
                dept["result"]["packages"].each do |package|
                    begin
                        puts "  > #{package['name']}"
                        packages_json = open("http://data.gov.uk/api/3/action/package_show?id=#{package['id']}")
                        packages = JSON.load(packages_json)
                        packages['result']['resources'].each do |resource|
                            Resource.create(url: resource['url'], department: department)
                        end
                    rescue
                        puts "! Failed to import #{package['name']}"
                    end
                end
            rescue
                puts "! Failed to import #{department.name}"
            end
        end
    end

end
