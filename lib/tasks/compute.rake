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

    desc "Get all status codes for resources after download"
    task :statuses => :environment do
        Resource.all.each do |resource|
            begin
                uri = URI(resource.url)
                req = Net::HTTP.new(uri.host, uri.port)
                if resource.url.match /^https/i
                    req.use_ssl = true
                end
                res = req.request_head(uri)
                resource.http_status = res.code.to_i
                resource.save!
            rescue
            end
        end
    end

end
