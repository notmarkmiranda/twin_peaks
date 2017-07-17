class AddDefaultValueToStudyStatus < ActiveRecord::Migration[5.1]
  def change
    change_column :studies, :status, :integer, default: 0
  end
end
