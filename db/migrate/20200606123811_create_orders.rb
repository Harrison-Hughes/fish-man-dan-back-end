class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.string :reason_for_decline
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
