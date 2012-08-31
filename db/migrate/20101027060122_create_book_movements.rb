#Copyright 2010 Foradian Technologies Private Limited
#This product includes software developed at
#Project Fedena - http://www.projectfedena.org/
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing,
#software distributed under the License is distributed on an
#"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
#KIND, either express or implied.  See the License for the
#specific language governing permissions and limitations
#under the License.
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
