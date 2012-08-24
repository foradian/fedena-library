class CreateBookMovements < ActiveRecord::Migration
  def self.up
    create_table :book_movements do |t|
      t.references :user
      t.references :book
      t.date :issue_date
      t.date :due_date
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :book_movements
  end
end
