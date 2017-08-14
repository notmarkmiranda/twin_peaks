class ChangeTypeOnStudies < ActiveRecord::Migration[5.1]
  def change
    add_column :studies, :study_type, :integer
    remove_column :studies, :type, :integer
  end
end
