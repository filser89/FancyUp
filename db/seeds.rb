# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'json'
require 'open-uri'
require 'byebug'

# def img_scraper(name)
#   url = "https://yandex.ru/images/search?text=#{name} male"
#   p url

#   html_file = open(url).read
#   html_doc = Nokogiri::HTML(html_file)

#   elements =  html_doc.search('.serp-item__link')

#   path = elements.first.attribute('href').value
#   img_url = "https://yandex.ru#{path}"
#   p img_url
#   img_html_file = open(img_url).read
#   debugger
#   img_html_doc = Nokogiri::HTML(img_html_file)
#   images = img_html_doc.search('.MMImage-Origin')
#   p images
#   img = images.first
#   img.attribute('src').value

# end

# def get_image(name)
#   url = "https://api.unsplash.com/search/photos?page=1&query=#{name}&client_id=mEOAqs9Q_lrTzYvH3zBMO19ut5VicXdzd6X1z724jiw"

#   res = open(url).read
#   image_hash = JSON.parse(res)
#   image_hash["results"][0]["urls"]["thumb"]
# end


User.destroy_all
Rental.destroy_all
Order.destroy_all








def set_color(category)
  color = case category
  when "suit"
    "gray"
  when "pants"
    "blue"
  when "tie"
    "red"
  when "shirt"
    "white"
  when "coat"
    "black"
  when "jacket"
    "black"
  when "sweater"
    "brown"
  when "belt"
    "brown"
  when "shoes"
    "black"
  end

  color
end

def set_image(category)
  gray_suit = "https://handcmediastorage.blob.core.windows.net/productimages/JK/JKPRAS01-F30V-121332-800px-1040px.jpg"
  blue_pants = "https://i.ebayimg.com/images/g/NmIAAOSwKc1cPz-v/s-l1600.jpg"
  red_tie = "https://www.tiesrus.co.uk/images/pre-tied-burgundy-satin-boys-tie-age-4-7-p855-13090_zoom.jpg"
  white_shirt = "https://agorawear.co.bw/java_content/uploads/2019/11/Agora-Wear_3307.jpeg"
  black_coat = "https://media.mauvetree.com/wp-content/uploads/2019/02/Justified-TV-Series-Raylan-Givens-Trench-Coat.jpg"
  black_jacket = "https://www.dunhill.com/product_image/12249965vf/f/w750_be4e4e4.jpg"
  brown_sweater = "https://clothbase.s3.amazonaws.com/uploads/43c6c4ee-6204-4ea1-a423-ea33d42d830a/image.jpg"

  brown_belt = "https://images-na.ssl-images-amazon.com/images/I/912gy9ku2VL._UL1500_.jpg"
  black_shoes = "https://5.imimg.com/data5/TV/EM/MY-8852934/formal-shoes-500x500.jpg"
  image = case category
  when "suit"
    gray_suit
  when "pants"
    blue_pants
  when "tie"
    red_tie
  when "shirt"
    white_shirt
  when "coat"
    black_coat
  when "jacket"
    "black"
  when "sweater"
    brown_sweater
  when "belt"
    brown_belt
  when "shoes"
    black_shoes
  end
  image
end

10.times do |i|
  u = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    password: "123456",
    address: Faker::Address.street_address,
    open_id: "12345#{i}"
  )
  puts "Created user #{u.first_name} #{u.last_name}"
  rand(0..3).times do |variable|
    category = Rental::CATEGORIES.sample
    color = set_color(category)
    image = set_image(category)
    name = "#{['amazing', 'fancy', 'fashionable'].sample.capitalize} #{color.capitalize} #{category}"
    occasion = Rental::OCCASIONS.sample
    size = ["S", "M", "L", "XL", "XXL"].sample
    r = Rental.create!(name: name, category: category, occasion: occasion, size: size, available: true, rented: false, color: color, user: u, image: image)
  end
end
