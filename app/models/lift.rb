class Lift < ApplicationRecord
  validates :location, presence: true
  validates :from_to, presence: true
  validates :shareable, presence: true

  belongs_to :institution
  belongs_to :student
  has_one :driver
  has_one :businfo
end
