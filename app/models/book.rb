class Book < ActiveRecord::Base
  acts_as_taggable
belongs_to :book_movement
has_many :book_reservations, :dependent => :destroy
validates_presence_of :book_number, :title, :author, :tag_list
validates_uniqueness_of :book_number
before_destroy :delete_dependency

cattr_reader :per_page

  @@per_page = 25

  def get_student_id
    return Student.find_by_admission_no(self.book_movement.user.username).id
  end

  def get_employee_id
    return  Employee.find_by_employee_number(self.book_movement.user.username).id
  end

  def delete_dependency
    movements = BookMovement.find_all_by_book_id(self.id)
    BookMovement.destroy_all(:id => movements.map(&:id))
  end

end
