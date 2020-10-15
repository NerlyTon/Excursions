class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :excursion


  def people
    Booking.all.each do |booking|
      booking.num_of_people
    end
  end

end
