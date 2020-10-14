class RemoveInfoFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :info, :string
  end
end
