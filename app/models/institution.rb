class Institution < ApplicationRecord
  validates :location, presence: true
  validates :name, presence: true

  #has_many :people
  #has_many :lifts
  #has_many :groups
  #has_many :businfos
end
