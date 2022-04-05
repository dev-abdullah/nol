class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_one :card

  after_create_commit :card_create

  private

  def card_create
    self.create_card(balance: 0)
  end
end
