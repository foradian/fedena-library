class LibraryCardSetting < ActiveRecord::Base
  belongs_to :course
  belongs_to :student_category
  validates_presence_of :books_issueable
  validates_uniqueness_of :student_category_id, :scope => [:course_id],:case_sensitive => false

end
