class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :line_one
      t.string :line_two
      t.string :town_city
      t.string :county
      t.string :contact_number
      t.string :extra_info
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end