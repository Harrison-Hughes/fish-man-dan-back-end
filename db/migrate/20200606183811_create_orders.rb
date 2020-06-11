class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.string :note_from_buyer
      t.string :note_from_seller
      t.references :user, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.timestamps
    end
  end
end
