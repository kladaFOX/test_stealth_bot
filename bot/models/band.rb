# frozen_string_literal: true

class Band < BotRecord
  has_many :ratings, dependent: :destroy

  validates :title, :foundation_year, presence: true
  validates :foundation_year, numericality: { only_integer: true, greater_than: 1800, less_than: Date.today.year }

  def score
    scores = ratings.pluck(:score)
    scores.sum(0) / scores.size
  end
end
