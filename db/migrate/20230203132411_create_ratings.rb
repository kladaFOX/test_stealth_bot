class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :score
      t.string :owner_number
      t.belongs_to :band
    end

    add_index :ratings, [:owner_number, :band_id], unique: true
  end
end
