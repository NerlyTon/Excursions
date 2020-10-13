class Excursion < ApplicationRecord
    has_many :bookings
    has_many :users, through: :bookings
    validates_presence_of :company, :title, :price
end
