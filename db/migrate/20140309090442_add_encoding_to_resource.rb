class AddEncodingToResource < ActiveRecord::Migration
  def change
    add_column :resources, :encoding, :string
  end
end
