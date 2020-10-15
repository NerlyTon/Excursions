class Excursion < ApplicationRecord
    has_many :bookings
    has_many :users, through: :bookings
    validates_presence_of :company, :title, :price
    scope :all_inclusive, -> { where(all_inclusive: true) }
    

    # def self.all_inclusive_list
    #     where(:all_inclusive => true)
    # end

    def prices
        Excursion.all.each do |excursion|
            excursion.price 
        end
    end
    
end