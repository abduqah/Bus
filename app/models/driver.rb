class Driver < ApplicationRecord
  validates :licence, presence: true

  belongs_to :person
end
