class AddHttpStatusCodeToResource < ActiveRecord::Migration
  def change
    add_column :resources, :http_status, :integer
  end
end
