# frozen_string_literal: true

class UserLastResponse < BotRecord
  validates :owner_number, :message, presence: true
end
