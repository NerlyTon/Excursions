class User < ApplicationRecord
    has_secure_password
    has_many :bookings
    has_many :excursions, through: :bookings
    validates_presence_of :name, :email, :password
    validates_uniqueness_of :email

end
