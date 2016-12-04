class Rider < ApplicationRecord

  has_one :contract
  has_many :earnings
  accepts_nested_attributes_for :contract

  scope :sorted, lambda { order("created_at ASC") }

end
