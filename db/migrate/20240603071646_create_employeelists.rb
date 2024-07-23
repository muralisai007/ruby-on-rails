class CreateEmployeelists < ActiveRecord::Migration[7.1]
  def change
    create_table :employeelists do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_no
      t.string :email
      t.date :date_of_birth
      t.string :aadhaar_input
      t.string :designation
      t.integer :status
      t.float :salary
      t.integer :extra_leaves, default: 0
      t.timestamps
    end
  end
end
