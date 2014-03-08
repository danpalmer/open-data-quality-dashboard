class AddPublisherIdToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :publishes_as, :string
  end
end
