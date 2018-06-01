
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Ticket.destroy_all
User.destroy_all

u1 = User.create!(
  email: "alex@gmail.com",
  password: "Rubyonrails",
  first_name: "Alexander",
  last_name: "Stevens",
  bankaccount: "BE123456789",
  phone: 324744448)

u2 = User.create!(
  email: "uma@gmail.com",
  password: "Bitchonrails",
  first_name: "Uma",
  last_name: "Patel",
  bankaccount: "AU123456789",
  phone: 494744448)

u3 = User.create!(
  email: "lui@gmail.com",
  password: "Kingonrails",
  first_name: "Lui",
  last_name: "Joy",
  bankaccount: "AU987654321",
  phone: 492382821)

t1 = Ticket.create!(
  seller_id: u1.id,
  date: DateTime.new(2018,5,27,18,30,0),
  departing_city: "Brussels",
  arrival_city: "London",
  price_cents: 6900,
  booking_reference: "TW6GZ2",
  name_on_ticket: "Stevens")

t2 = Ticket.create!(
  seller_id: u2.id,
  date: DateTime.new(2018,6,27,7,0,0),
  departing_city: "Paris",
  arrival_city: "London",
  price_cents: 5000,
  booking_reference: "AS7FZ2",
  name_on_ticket: "Patel")

t3 = Ticket.create!(
  seller_id: u3.id,
  date: DateTime.new(2018,6,01,10,30,0),
  departing_city: "Brussels",
  arrival_city: "Paris",
  price_cents: 1000,
  booking_reference: "AS897D",
  name_on_ticket: "Joy")

t4 = Ticket.create!(
  seller_id: u2.id,
  date: DateTime.new(2018,7,13,18,31,0),
  departing_city: "London",
  arrival_city: "Paris",
  price_cents: 8000,
  booking_reference: "SQMBOF",
  name_on_ticket: "Patel")
