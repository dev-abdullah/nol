class Card < ApplicationRecord
  has_many :transactions
  belongs_to :user
end
