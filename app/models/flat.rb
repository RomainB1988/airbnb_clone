class Flat < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :comments, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
# Compare this snippet from app/models/reservation.rb:
# class Reservation
