require 'open-uri'
CACHE_DIR = "/Users/dan/Desktop/data_gov_uk_files"

namespace "import" do

    desc "Download files for Resources"
    task :files => :environment do
        Resource.all.each do |resource|
            begin
                filename = resource.url.split('/').last
                filepath = "#{CACHE_DIR}/#{filename}"
                if !resource.file? && File.exist?(filepath)
                    puts filename
                    resource.file = open(filepath)
                    resource.exists = true
                    resource.save!
                elsif !resource.file?
                    f = open(resource.url)
                    resource.file = f
                    resource.exists = true
                    resource.save!
                elsif resource.file?
                    resource.exists = true
                    resource.save!
                    puts "Resource already exists"
                end
            rescue => e
                puts e
                resource.exists = false
                resource.save!
                puts "! Failed to download #{resource.url}"
            end
        end
    end

end
