class CreateBookReservations < ActiveRecord::Migration
  def self.up
    create_table :book_reservations do |t|
      t.references :user
      t.references :book
      t.datetime :reserved_on
      t.timestamps
    end
  end

  def self.down
    drop_table :book_reservations
  end
end
