class CreateUserLastResponse < ActiveRecord::Migration[6.0]
  def change
    create_table :user_last_responses do |t|
      t.string :message
      t.string :owner_number

      t.timestamps
    end
  end
end
