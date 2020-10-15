class AddNumOfPeopleToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :num_of_people, :integer
  end
end
