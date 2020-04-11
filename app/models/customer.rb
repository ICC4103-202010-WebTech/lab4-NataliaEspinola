class Customer < ApplicationRecord
  has_many :orders
  has_many :tickets, through: :orders

  validates :lastname, presence: true
  validate :has_valid_email?

  valid_email = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def has_valid_email?
    self.email = valid_email
  end
end
