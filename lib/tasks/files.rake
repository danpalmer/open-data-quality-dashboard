CACHE_DIR = "/Users/dan/Desktop/data_gov_uk_files"

namespace "import" do

    desc "Download files for Resources"
    task :files => :environment do
        Resource.all.each do |resource|
            filename = resource.url.split('/').last
            filepath = "#{CACHE_DIR}/#{filename}"
            if !resource.file? && File.exist?(filepath)
                puts filename
                resource.file = open(filepath)
                resource.save!
            end
        end
    end

end
