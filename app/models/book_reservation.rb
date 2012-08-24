class BookReservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  before_destroy :update_book_status

  validates_uniqueness_of :book_id

  def update_book_status
    book = self.book
    if book.status == "Reserved"
      book.update_attributes(:book_movement_id =>nil,:status=>'Available')
    end
  end

end
