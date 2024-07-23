class AddMonthToLeaveslists < ActiveRecord::Migration[7.1]
  def change
    add_column :leaveslists, :month, :string
  end
end
