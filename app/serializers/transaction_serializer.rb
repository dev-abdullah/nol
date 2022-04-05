class TransactionSerializer < ActiveModel::Serializer

  attributes :id, :medium, :actual_amount, :deducted_amount, :deposit_amount, :status, :transaction_type

  attribute :station_from
  attribute :station_to
  attribute :transaction_date

  def station_from
    object.station_transactions&.station_from&.last&.station&.name
  end

  def station_to
    object.station_transactions&.station_to&.last&.station&.name
  end

  def transaction_date
    object.created_at.strftime("%-d/%-m/%y %H:%M")
  end
end
