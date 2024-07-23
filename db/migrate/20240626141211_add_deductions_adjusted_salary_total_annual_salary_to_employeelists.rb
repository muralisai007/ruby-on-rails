class AddDeductionsAdjustedSalaryTotalAnnualSalaryToEmployeelists < ActiveRecord::Migration[7.1]
  def change
    add_column :employeelists, :deductions, :float
    add_column :employeelists, :adjusted_salary, :float
    add_column :employeelists, :total_annual_salary, :float
  end
end
