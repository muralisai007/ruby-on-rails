class ChangeSalaryToFloatInEmployees < ActiveRecord::Migration[7.1]
  def change
    change_column :employees, :salary, :float
  end
end
