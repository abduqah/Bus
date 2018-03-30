class Businfo < ApplicationRecord
  validates :busID, presence: true

  belongs_to :institution
  has_many :students
  #has_many :teachers
end
