class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :date
      t.time :pick_up
      t.time :drop_off
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :excursion, null: false, foreign_key: true
      t.string :info

      t.timestamps
    end
  end
end
