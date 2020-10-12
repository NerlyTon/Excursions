class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :business
      t.string :password_digest

      t.timestamps
    end
  end
end
