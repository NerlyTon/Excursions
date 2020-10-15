class Excursion < ApplicationRecord
    has_many :bookings
    has_many :users, through: :bookings
    validates_presence_of :company, :title, :price
    

# def self.all_inclusive
#     where("LOWER(title) LIKE ?", "all inclusive")
# end
    
end