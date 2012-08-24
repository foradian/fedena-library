class BookMovement < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  validates_presence_of :user_id, :book_id, :issue_date, :due_date
  has_one :event, :as=> :origin
  has_many :finance_transactions ,:as=>:finance
  before_destroy :update_book_status

  def get_student_id
    return Student.find_by_admission_no(self.user.username).id
  end

  def get_employee_id
    return  Employee.find_by_employee_number(self.user.username).id
  end

  def fee_table
  end

  def update_book_status
    book = self.book
    if book.book_movement_id == self.id
      book.update_attributes(:book_movement_id =>nil,:status=>'Available')
    end
  end
end
