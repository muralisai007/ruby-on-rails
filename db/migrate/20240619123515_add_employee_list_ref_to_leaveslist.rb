class AddEmployeeListRefToLeaveslist < ActiveRecord::Migration[7.1]
  def change
    add_reference :leaveslists, :employeelist, null: false, foreign_key: true
  end
end
