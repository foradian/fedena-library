class AddFieldToStudents < ActiveRecord::Migration
  def self.up
    add_column :students,:library_card,:string
    add_column :employees,:library_card,:string
    add_column :archived_students,:library_card,:string
    add_column :archived_employees,:library_card,:string
  end

  def self.down
    remove_column :students,:library_card,:string
    remove_column :employees,:library_card,:string
    remove_column :archived_students,:library_card,:string
    remove_column :archived_employees,:library_card,:string
  end
end
