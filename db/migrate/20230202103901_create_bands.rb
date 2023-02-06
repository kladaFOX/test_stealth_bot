class CreateBands < ActiveRecord::Migration[6.0]
  def change
    create_table :bands do |t|
      t.string :title
      t.integer :foundation_year
    end
  end
end
