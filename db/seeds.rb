User.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

u1 = User.create!(
  email: "alex@gmail.com",
  password: "Rubyonrails",
  firstname: "Alexander",
  lastname: "Stevens",
  bankaccount: "BE123456789",
  phone: 324744448)

u2 = User.create!(
  email: "uma@gmail.com",
  password: "Bitchonrails",
  firstname: "Uma",
  lastname: "Patel",
  bankaccount: "AU123456789",
  phone: 494744448)

t1 = Ticket.create!(
  seller_id: 1,
  date: DateTime.new(2018,5,27,18,30,0),
  departing_city: "Brussels",
  arrival_city: "London",
  price: 69,
  booking_reference: "TW6GZ2")

t2 = Ticket.create!(
  seller_id: 2,
  date: DateTime.new(2018,6,27,7,0,0),
  departing_city: "Paris",
  arrival_city: "London",
  price: 50,
  booking_reference: "AS7FZ2")

