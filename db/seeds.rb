puts 'Cleaning database...'
Ticket.destroy_all
User.destroy_all

u1 = User.create!(
  email: "astev2018@gmail.com",
  password: "Rubyonrails",
  first_name: "Alexander",
  last_name: "Stevens",
  bankaccount: "BE123456789",
  phone: 324744448)

u2 = User.create!(
  email: "umabpatel@gmail.com",
  password: "Bitchonrails",
  first_name: "Uma",
  last_name: "Patel",
  bankaccount: "AU123456789",
  phone: 494744448)

u3 = User.create!(
  email: "lui.kohl@gmail.com",
  password: "Kingonrails",
  first_name: "Lui",
  last_name: "Joy",
  bankaccount: "AU987654321",
  phone: 492382821)

t1 = Ticket.create!(
  seller_id: u1.id,
  date: Date.new(2018,5,27),
  time: "18:30",
  departing_city: "Brussels",
  arrival_city: "London",
  price_cents: 6900,
  booking_reference: "TW6GZ2",
  name_on_ticket: "Stevens")

t2 = Ticket.create!(
  seller_id: u2.id,
  date: Date.new(2018,6,27),
  time: "7:00",
  departing_city: "Paris",
  arrival_city: "London",
  price_cents: 5000,
  booking_reference: "AS7FZ2",
  name_on_ticket: "Patel")

t3 = Ticket.create!(
  seller_id: u3.id,
  date: Date.new(2018,6,01),
  time: "10:30",
  departing_city: "Brussels",
  arrival_city: "Paris",
  price_cents: 1000,
  booking_reference: "AS897D",
  name_on_ticket: "Joy")

t4 = Ticket.create!(
  seller_id: u2.id,
  date: Date.new(2018,7,13),
  time: "18:31",
  departing_city: "London",
  arrival_city: "Paris",
  price_cents: 8000,
  booking_reference: "SQMBOF",
  name_on_ticket: "Patel")

t5 = Ticket.create!(
  seller_id: u3.id,
  date: Date.new(2018,7,13),
  time: "12:30",
  departing_city: "London",
  arrival_city: "Paris",
  price_cents: 8000,
  booking_reference: "SBISHF",
  name_on_ticket: "Kohl")

t6 = Ticket.create!(
  seller_id: u1.id,
  date: Date.new(2018,7,13),
  time: "14:00",
  departing_city: "London",
  arrival_city: "Paris",
  price_cents: 9000,
  booking_reference: "QUOTOF",
  name_on_ticket: "Stevens")

t7 = Ticket.create!(
  seller_id: u2.id,
  date: Date.new(2018,7,13),
  time: "11:00",
  departing_city: "London",
  arrival_city: "Paris",
  price_cents: 7500,
  booking_reference: "QWERTY",
  name_on_ticket: "Kolkman")

t8 = Ticket.create!(
  seller_id: u3.id,
  date: Date.new(2018,7,13),
  time: "19:00",
  departing_city: "London",
  arrival_city: "Paris",
  price_cents: 8500,
  booking_reference: "ASDFGH",
  name_on_ticket: "von Hammerstein")

t9 = Ticket.create!(
  seller_id: u2.id,
  date: Date.new(2018,7,13),
  time: "06:00",
  departing_city: "London",
  arrival_city: "Paris",
  price_cents: 5500,
  booking_reference: "ZXCVBN",
  name_on_ticket: "Clavel")
