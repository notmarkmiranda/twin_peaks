class CreateStudy < ActiveRecord::Migration[5.1]
  def change
    create_table :studies do |t|
      t.integer :type
      t.string :name
      t.string :alias
      t.integer :status
      t.string :protocol_number
      t.integer :creator_id
    end

      add_index :studies, :creator_id
  end
end
