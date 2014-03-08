class Resource < ActiveRecord::Base
    has_attached_file :file
    do_not_validate_attachment_file_type :file
    validates_attachment_file_name :file, :matches => /.*/
    belongs_to :department
end
