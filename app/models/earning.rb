class Earning < ApplicationRecord

  belongs_to :rider

  scope :sorted, lambda { order("created_at ASC") }

end
