class Earning < ApplicationRecord

  belongs_to :rider

  scope :sorted, lambda { order("created_at ASC") }
  scope :total, lambda { sum }

end
