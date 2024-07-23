class AddExtraLeavesToEmployeelists < ActiveRecord::Migration[7.1]
  def change
    add_column :employeelists, :extra_leaves, :integer, default: 0
  end
end
