class CreateOpenData < ActiveRecord::Migration
  def up
    create_table :open_data do |t|
      t.string :name
      t.string :street_address
      t.string :zip
      t.string :phone
      t.string :cuisine
      t.string :violation
      t.string :grade
      t.datetime :grade_date
    end
  end

  def down
    drop_table :open_data
  end
end
