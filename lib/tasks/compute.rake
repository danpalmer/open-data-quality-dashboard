namespace "compute" do

    desc "Compute file extensions"
    task :extensions => :environment do
        Resource.all.each do |resource|
            if !resource.file?
                next
            end
            filename = Pathname.new(resource.file.path)
                               .extname
                               .split('_')
                               .first
            if filename.nil? or filename.blank?
            else
                filename.gsub!('.', '').downcase!
                resource.extension = filename
                resource.save!
            end
        end
    end

end
