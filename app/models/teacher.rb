class Teacher < ApplicationRecord
  validates :degree, presence: true
  validates :position, presence: true

  #belongs_to :person
  #has_and_belongs_to_many  :students
end
