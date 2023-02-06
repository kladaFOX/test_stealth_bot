# frozen_string_literal: true

class BandsController < BotController

  def ask_action
    send_replies
    update_session_to state: 'get_action'
  end

  def get_action
    if current_message.message.downcase == 'a'
      step_to state: :index
    elsif current_message.message !~ /\D/ # check if message contains only numbers
      @band = Band.find(current_message.message.to_i)
      UserLastResponse.create(owner_number: current_session.id, message: current_message.message) if @band.present?
      send_replies(custom_reply: 'bands/show')
      step_to state: :ask_for_change_rating
    else
      step_to state: :ask_action
    end
  end

  def index
    @bands = Band.all.order(title: :asc)
    send_replies
    step_to state: :ask_action
  end

  def ask_for_change_rating
    user_last_response = UserLastResponse.where(owner_number: current_session.id)
                                          .order(created_at: :desc).limit(1).take
    @band = Band.find(user_last_response.message.to_i)
    send_replies
    update_session_to state: 'get_change_rating'
  end

  def get_change_rating
    if current_message.message.downcase == 'a'
      step_to state: :ask_for_new_rating
    elsif current_message.message.downcase == 'b'
      step_to state: :ask_action
    else
      step_to state: :ask_for_change_rating
    end
  end

  def ask_for_new_rating
    user_last_response = UserLastResponse.where(owner_number: current_session.id)
                                          .order(created_at: :desc).limit(1).take
    @band = Band.find(user_last_response.message.to_i)
    @user_vote = Rating.where(band: @band, owner_number: current_session.id)
    send_replies
    update_session_to state: 'get_new_rating'
  end

  def get_new_rating
    user_last_response = UserLastResponse.where(owner_number: current_session.id)
                                         .order(created_at: :desc).limit(1).take
    @band = Band.find(user_last_response.message.to_i)
    if current_message.message !~ /\D/ # check if message contains only numbers
      @user_vote = update_or_create_rating(@band, current_session.id)
    else
      send_replies inline: [{ 'reply_type' => 'text', 'text' => 'Invalid response! Try again.' }]
      return step_to state: :ask_for_new_rating
    end

    if @user_vote.valid?
      send_replies inline: [{ 'reply_type' => 'text', 'text' => 'Successfully saved!' }]
      step_to state: :ask_action
    else
      send_replies inline: [{ 'reply_type' => 'text', 'text' => @user_vote.errors.full_messages }]
      step_to state: :ask_for_new_rating
    end
  end

  private

  def update_or_create_rating(band, owner_number)
    @user_vote = Rating.where(band: band, owner_number: owner_number).take
    if @user_vote.present?
      @user_vote.update(score: current_message.message.to_i)
    else
      @user_vote = Rating.create(band: @band, owner_number: owner_number, score: current_message.message.to_i)
    end
    @user_vote
  end
end
