# frozen_string_literal: true

class HellosController < BotController

  def say_hello
    send_replies
    step_to flow: :band
  end

end
