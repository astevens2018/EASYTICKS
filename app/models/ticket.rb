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

def seller_url
    if facebook_picture_url
      return facebook_picture_url
    elsif photo_url
      return photo_url
    else
      return "https://cdn1.iconfinder.com/data/icons/user-pictures/100/female1-512.png"
    end
end

