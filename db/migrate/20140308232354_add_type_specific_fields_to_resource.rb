class AddTypeSpecificFieldsToResource < ActiveRecord::Migration
  def change

      add_column :resources, :csv_is_valid, :boolean
      add_column :resources, :csv_has_valid_headings, :boolean
      add_column :resources, :csv_rows, :integer
      add_column :resources, :csv_encoding, :string

      add_column :resources, :spreadsheet_is_valid, :boolean
      add_column :resources, :spreadsheet_has_valid_sheet_names, :boolean
      add_column :resources, :spreadsheet_sheets, :integer
      add_column :resources, :spreadsheet_contains_graphs, :boolean
      add_column :resources, :spreadsheet_contains_images, :boolean

      add_column :resources, :html_is_index_html, :boolean
      add_column :resources, :html_contains_data_links, :boolean

      add_column :resources, :pdf_is_valid, :boolean
      add_column :resources, :pdf_pages, :integer
      add_column :resources, :pdf_contains_text, :boolean
      add_column :resources, :pdf_contains_drm, :boolean

      add_column :resources, :zip_is_valid, :boolean
      add_column :resources, :zip_files, :integer

      add_column :resources, :xml_is_valid, :boolean
      add_column :resources, :xml_contains_schema, :boolean

      add_column :resources, :presentation_is_valid, :boolean
      add_column :resources, :presentation_slides, :integer

      add_column :resources, :json_is_valid, :boolean

      add_column :resources, :last_modified, :datetime
      add_column :resources, :ms_office_version, :string
      add_column :resources, :extension, :string

  end
end
