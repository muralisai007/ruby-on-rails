class AddLeavesDataToLeaveslists < ActiveRecord::Migration[6.1]
  def change
    add_column :leaveslists, :leaves_data, :jsonb, default: {
      default_leaves: {
        january: 0, february: 0, march: 0, april: 0, may: 0, june: 0,
        july: 0, august: 0, september: 0, october: 0, november: 0, december: 0
      },
      extra_leaves: {
        january: 0, february: 0, march: 0, april: 0, may: 0, june: 0,
        july: 0, august: 0, september: 0, october: 0, november: 0, december: 0
      },
      deductions: {
        january: 0, february: 0, march: 0, april: 0, may: 0, june: 0,
        july: 0, august: 0, september: 0, october: 0, november: 0, december: 0
      }
    }
  end
end

