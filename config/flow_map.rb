class FlowMap

  include Stealth::Flow

  flow :hello do
    state :say_hello
  end

  flow :band do
    state :ask_action
    state :get_action, fails_to: :ask_action
    state :show
    state :index
    state :ask_for_change_rating
    state :get_change_rating, fails_to: :ask_for_change_rating
    state :ask_for_new_rating
    state :get_new_rating, fails_to: :ask_for_new_rating

  end

  flow :goodbye do
    state :say_goodbye
  end

  flow :interrupt do
    state :say_interrupted
  end

  flow :unrecognized_message do
    state :handle_unrecognized_message
  end

  flow :catch_all do
    state :level1
  end

end
