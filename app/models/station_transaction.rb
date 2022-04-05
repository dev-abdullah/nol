class StationTransaction < ApplicationRecord
  belongs_to :station
  # belongs_to :transaction

  enum from_to: {
    station_from: 0,
    station_to: 1
  }
end
