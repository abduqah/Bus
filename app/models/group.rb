class Group < ApplicationRecord
  validates :gid, presence: true

  has_many :students
  has_many :teachers
end
