# frozen_string_literal: true

class Rating < BotRecord
  belongs_to :band

  validates :score, :owner_number, presence: true
  validates :owner_number, uniqueness: { scope: :band_id }
  validates :score, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
end
