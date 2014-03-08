class AddAttachmentFileToResources < ActiveRecord::Migration
  def self.up
    change_table :resources do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :resources, :file
  end
end
