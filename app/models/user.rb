class User < ApplicationRecord
    has_secure_password
    has_many :bookings
    has_many :excursions, through: :bookings
    validates_presence_of :name, :email
    validates :email, uniqueness: true

end
