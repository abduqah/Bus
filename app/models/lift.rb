class Lift < ApplicationRecord
  validates :location, presence: true
  validates :from_to, presence: true
  validates :shareable, presence: true

  belongs_to :institution
  has_many :students
  has_one :driver
  has_one :businfo
  has_one :teacher
end
