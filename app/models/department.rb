class Department < ActiveRecord::Base
    has_many :scores
    has_many :resources

    def rating
        resource_count = self.resources.count

        if resource_count == 0
            return 0
        end

        csv_invalid = self.resources.where(csv_is_valid: false).count
        pdf_invalid = self.resources.where(pdf_is_valid: false).count

        validity_rating = ((resource_count - (csv_invalid + pdf_invalid)).to_f/resource_count.to_f)

        nice_types = ['csv', 'atom', 'json', 'rdf', 'xml']
        nice_type_docs = self.resources.where("extension in (?)", nice_types).count

        type_niceness = nice_type_docs.to_f / resource_count.to_f

        nice_encodings = ['utf-8', 'us-ascii']
        nice_encoding_docs = self.resources.where("encoding in (?)", nice_encodings).count

        encoding_niceness = nice_encoding_docs.to_f / resource_count.to_f

        nice_statuses = [200, 301, 302]
        nice_status_docs = self.resources.where("http_status in (?)", nice_statuses).count

        status_niceness = nice_status_docs.to_f / resource_count.to_f

        return (validity_rating + type_niceness + encoding_niceness + status_niceness)
    end
end
