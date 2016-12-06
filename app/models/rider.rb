class Rider < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :contract
  has_many :earnings
  accepts_nested_attributes_for :contract

  scope :sorted, lambda { order("created_at ASC") }

end
