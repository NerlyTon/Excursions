class RemovePickUpFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :pick_up, :time
  end
end
