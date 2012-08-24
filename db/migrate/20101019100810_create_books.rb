class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :book_number
      t.references :book_movement
      t.string :status, :default=>'available'
      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
