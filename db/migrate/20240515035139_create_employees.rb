class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_no
      t.string :email
      t.date :date_of_birth
      t.string :aadhaar_input
      

      t.timestamps
    end
  end
end
