class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :full_name
      t.string :password_digest
      t.boolean :is_admin

      t.timestamps
    end
  end
end
