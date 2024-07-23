class CreateLeaveslist < ActiveRecord::Migration[7.1]
  def change
    create_table :leaveslists do |t|
      t.json :default_leaves, default: {}
      t.json :extra_leaves, default: {}
      t.json :deductions, default: {}

      t.timestamps
    end
  end
end
