class RemoveDropOffFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :drop_off, :time
  end
end
