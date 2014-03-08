class AddDepartmentToResource < ActiveRecord::Migration
  def change
    add_reference :resources, :department, index: true
  end
end
