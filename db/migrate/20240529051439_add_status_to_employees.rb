class AddStatusToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :status, :integer
  end
end
