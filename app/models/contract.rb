class Contract < ApplicationRecord

  belongs_to :rider, required: false
  has_many :salaries

  scope :sorted, lambda { order("created_at ASC") }

  CONTRACT_TYPES = ['Hourly', 'Drop-off']
  VEHICLE_TYPES = ['Bicycle', 'Scooter']

  validates :contract_type, :inclusion => {:in => CONTRACT_TYPES, :message => "must be one of: #{CONTRACT_TYPES.join(', ')}"}
  validates :vehicle, :inclusion => {:in => VEHICLE_TYPES, :message => "must be one of: #{ VEHICLE_TYPES.join(', ')}"}

end
