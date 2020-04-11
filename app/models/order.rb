class Order < ApplicationRecord
  belongs_to :customer
  has_many :tickets

  validates :customer, presence: true
end
