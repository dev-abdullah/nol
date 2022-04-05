class Transaction < ApplicationRecord
  has_many :station_transactions
  has_many :stations, through: :station_transactions
  belongs_to :card

  validate :validate_deposit, :validate_withdraw, :validate_medium

  enum medium: {
    no_medium: 0,
    bus: 1,
    metro: 2
  }

  enum status: {
    pending: 0,
    paid: 1,
    deposited: 2
  }

  enum transaction_type: {
    deposit: 0,
    withdraw: 1
  }

  private

  def validate_deposit
    if transaction_type == 0 && deposit_amount == 0
      errors.add(:deposit_amount, 'needs to be present if transaction type is deposit')
    end
  end

  def validate_withdraw
    if transaction_type == 1 && actual_amount == 0
      errors.add(:actual_amount, 'needs to be present if transaction type is withdraw')
    end
  end

  def validate_medium
    if transaction_type == 1 && medium == 0
      errors.add(:medium, 'can not be none if transaction type is withdraw')
    elsif transaction_type == 0 && medium != 0
      errors.add(:medium, 'can only be none if transaction type is deposit')
    end
  end
end
