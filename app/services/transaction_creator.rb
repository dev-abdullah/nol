class TransactionCreator
  def initialize(params)
    @params = params
  end

  def create
    ActiveRecord::Base.transaction do
      card = Card.find(@params[:card_id])
      if @params[:deposit_amount]
        deposit_amount = @params[:deposit_amount].to_f
        transaction = card.transactions.create(medium: 0,
                                              deposit_amount: deposit_amount,
                                              status: 2,
                                              transaction_type: 0)
        card.update!(balance: card.balance + deposit_amount)
        transaction
      else
        actual_amount = calculate_actual_amount(@params[:station_from], @params[:station_to])
        deducted_amount = calculate_deducted_amount(card, actual_amount, @params[:station_from], @params[:station_to])
        transaction = card.transactions.create(medium: @params[:medium].to_i,
                                              actual_amount: actual_amount,
                                              deducted_amount: deducted_amount,
                                              status: 1,
                                              transaction_type: 1)
        card.update!(balance: card.balance - deducted_amount)
        create_station_transaction(transaction, @params[:station_from].to_i, @params[:station_to].to_i)
        transaction
      end
    end
  end

  private

  def calculate_actual_amount(from, to)
    station_from = Station.find(from)
    station_to = Station.find(to)

    if station_from.zone == station_to.zone
      3.0
    elsif two_zone_fare(station_from.zone, station_to.zone)
      5.0
    else
      7.5
    end
  end

  def two_zone_fare(from_zone, to_zone)
    (from_zone == 'Zone 1' && to_zone == 'Zone 2') || (from_zone == 'Zone 2' && to_zone == 'Zone 1') ||
    (from_zone == 'Zone 2' && to_zone == 'Zone 6') || (from_zone == 'Zone 6' && to_zone == 'Zone 2') ||
    (from_zone == 'Zone 6' && to_zone == 'Zone 5') || (from_zone == 'Zone 5' && to_zone == 'Zone 6')
  end

  def calculate_deducted_amount(card, amount, from, to)
    last_transaction = card.transactions.withdraw&.last

    return amount if deduct_full_fare(last_transaction)
    return 0 if last_transaction.deducted_amount == 7.5

    from_zone = last_transaction.station_transactions&.station_from&.last&.station&.zone
    to_zone = last_transaction.station_transactions&.station_to&.last&.station&.zone

    station_from_zone = Station.find(from)&.zone
    station_to_zone = Station.find(to)&.zone

    (station_from_zone == to_zone && station_to_zone == from_zone) ? 0 : amount
  end

  def deduct_full_fare last_transaction
    last_transaction.blank? || last_transaction.deducted_amount == 0 ||
    ((Time.now - last_transaction.created_at) / 60) > 30
  end

  def create_station_transaction(transaction, from, to)
    transaction.station_transactions.create(station_id: from, from_to: 0)
    transaction.station_transactions.create(station_id: to, from_to: 1)
  end
end
