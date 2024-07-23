class ChangeSalaryDisbursedToFloatInEmployeelists < ActiveRecord::Migration[6.0]
  def change
    change_column :employeelists, :salary_disbursed, :float
  end
end
