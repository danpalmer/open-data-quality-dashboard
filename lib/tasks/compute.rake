require 'timeout'

namespace "compute" do

    desc "Check CSV files for errors"
    task :checkcsv => :environment do
        Resource.where("csv_is_valid is NULL and extension is 'csv'").each do |resource|
            puts "id: #{resource.id} #{resource.file.path}"
            output = "No errors."
            begin
                status = Timeout::timeout(5) {
                    output = `csvclean -nvl #{resource.file.path}`.strip
                }
            rescue
            end
            if output == 'No errors.'
                resource.csv_is_valid = true
                puts "VALID"
            else
                resource.csv_is_valid = false
                puts "! Invalid"
            end
            count = 0
            begin
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
            rescue
                resource.csv_has_valid_headings = false
            end
            resource.csv_rows = count
            resource.save!
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
            if resource.encoding.include? "ERROR"
                resource.encoding = nil
            end
            resource.save!
        end
    end

    desc "Get MS Office info"
    task :msoffice => :environment do
        Resource.where(extension: "doc").each do |resource|
            resource.document_pages = `wvsummary "#{resource.file.path}" | egrep -oe '(of (Pages|Slides) = )([0-9]+)' | egrep -o '[0-9]+'`
            resource.save!
        end
        Resource.where(extension: "ppt").each do |resource|
            resource.presentation_slides = `wvsummary "#{resource.file.path}" | egrep -oe '(of (Pages|Slides) = )([0-9]+)' | egrep -o '[0-9]+'`
            resource.save!
        end
    end

    desc "Get PDF Producers"
    task :pdf_producers => :environment do
        Resource.where(extension: "pdf").each do |resource|
            begin
                producer = /(?:Producer:      )(.+)$/.match(`pdfinfo "#{resource.file.path}" | grep 'Producer'`)[1]
                # puts producer
                # resource.pdf_is_valid = true
                # resource.save!
            rescue
                puts "Invalid PDF: #{resource.file.path}"
                # resource.pdf_is_valid = false
                # resource.save!
            end
        end
    end

end
