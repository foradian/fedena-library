class AddSchoolIdToLibrary < ActiveRecord::Migration
  def self.up
    [:tags,:taggings,:books,:library_card_settings,:book_reservations,:book_movements].each do |c|
      add_column c,:school_id,:integer
      add_index c,:school_id
    end
  end

  def self.down
    [:tags,:taggings,:books,:library_card_settings,:book_reservations,:book_movements].each do |c|
      remove_index c,:school_id
      remove_column c,:school_id
    end
  end
end
