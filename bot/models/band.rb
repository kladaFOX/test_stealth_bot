# frozen_string_literal: true

class Band < BotRecord
  validates :title, :foundation_year, presence: true
  validates :foundation_year, numericality: { only_integer: true, greater_than: 1800, less_than: Date.today.year }
end
