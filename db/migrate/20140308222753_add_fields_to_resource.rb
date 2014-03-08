class AddFieldsToResource < ActiveRecord::Migration
  def change
      add_column :resources, :exists, :boolean
      add_column :resources, :has_sane_filename, :boolean
      add_column :resources, :has_extension, :boolean
  end
end
