class AddBirthdayToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :birthday, :date
  end
end
