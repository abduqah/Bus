class Businfo < ApplicationRecord
  validates :busID, presence: true

  belongs_to :institution
  belongs_to :lift
  
end