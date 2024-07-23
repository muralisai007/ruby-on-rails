class AddColumnsToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :designation, :string
    add_column :employees, :salary, :decimal
    
  end
end
