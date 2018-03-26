class Person < ApplicationRecord
  validates :nid, presence: true
  validates :name, presence: true
  validates :bd, presence: true
  validates :live_in, presence: true

  # has_one :teacher
  # has_one :student
  # has_one :parent
  # has_one :driver
  #belongs_to :institution
end
