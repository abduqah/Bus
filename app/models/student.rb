class Student < ApplicationRecord

  has_and_belongs_to_many  :teachers
  belongs_to :person
  has_one :parent
  belongs_to :lifts
end
