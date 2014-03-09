namespace "compute" do

  desc "Check CSV files for errors"
  task :checkcsv => :environment do
    Resource.where(extension: 'csv') do |resource|
      output = `csvclean -nvl #{resource.file.path}`
      if output == 'No errors.'
        resource.csv_is_valid = true
      else
        resource.csv_is_valid = false
      end
      count = 0
      open(resource.file.path).each do |line|
        if count == 0
          if line =~ /^([a-z_0-9]+, ?)+([a-z_0-9]+)$/
            resource.csv_has_valid_headings = true
          else 
            resource.csv_has_valid_headings = false
          end
        end
        count += 1
      end
      resource.csv_rows = count
    end
  end

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

    desc "Get encoding of files"
    task :encodings => :environment do
        Resource.where("file_file_name not NULL").each do |resource|
            resource.encoding = `file -b --mime-encoding "#{resource.file.path}"`.strip
            resource.save!
        end
    end

end
