class Ticket < ApplicationRecord
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :seller, class_name: "User", optional: true
  monetize :price_cents
  validates :date, presence: true
  validates :arrival_city, presence: true
  validates :departing_city, presence: true
  validates :booking_reference, presence: true, uniqueness: true
  validates :name_on_ticket, presence: true
end
