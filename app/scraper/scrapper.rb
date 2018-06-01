require 'open-uri'
require 'nokogiri'

bookingreference = @tickets.booking_reference
lastname = @tickets.name_on_ticket
url = "https://managebooking.eurostar.com/uk-en/dashboard?pnr=#{bookingreference}&surname=#{lastname}"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.m_titre_resultat a').each do |element|
  puts element.text.strip
  puts element.attribute('href').value
end
