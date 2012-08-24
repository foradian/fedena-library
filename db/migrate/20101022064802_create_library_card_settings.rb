class CreateLibraryCardSettings < ActiveRecord::Migration
  def self.up
    create_table :library_card_settings do |t|
      t.references :course
      t.references :student_category
      t.integer :books_issueable
      t.integer :time_period, :default=>'30'
      t.timestamps
    end
  end

  def self.down
    drop_table :library_card_settings
  end
end
