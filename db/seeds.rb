# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

puts "Destroying all database records!"

Availability.destroy_all
Booking.destroy_all
Band.destroy_all
User.destroy_all

puts "Starting Seeding!"

User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123123")
User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123123")
User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123123")
User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123123")
User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123123")
User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123123")

band_one = Band.new(name: "One Direction",
  description: "One Direction, often shortened to 1D, are an English-Irish pop boy band formed in London in 2010. The group is composed of Niall Horan, Liam Payne, Harry Styles, Louis Tomlinson, and previously Zayn Malik until his departure from the group in March 2015.",
  genre: "Pop",
  user: User.first
)

file = URI.open("https://static.republika.co.id/uploads/images/inpicture_slide/one-direction-_130519230453-399.jpg")
band_one.photo.attach(io: file, filename: "1d.png", content_type: "image/png")
band_one.save!


band_two = Band.new(name: "Westlife",
    description: "Westlife are an Irish pop group formed in Dublin, Ireland in 1998. The group consists of members Shane Filan, Mark Feehily, Kian Egan, and Nicky Byrne. Brian McFadden was a member before leaving in 2004. The group disbanded in 2012 after 14 years and later reunited in 2018.",
    genre: "Pop",
    user: User.second
  )

file = URI.open("https://apicms.thestar.com.my/uploads/images/2023/02/03/1926465.jpg")
band_two.photo.attach(io: file, filename: "westlife.png", content_type: "image/png")
band_two.save!

band_three = Band.new(name: "Radiohead",
    description: "Radiohead are an English rock band formed in Abingdon, Oxfordshire, in 1985. The band consists of Thom Yorke (vocals, guitar, piano, keyboards); brothers Jonny Greenwood (guitar, keyboards, other instruments) and Colin Greenwood (bass); Ed O'Brien (guitar, backing vocals); and Philip Selway (drums, percussion).",
    genre: "Alternative Rock",
    user: User.third
  )

file = URI.open("https://media.npr.org/assets/img/2019/06/11/gettyimages-80530629-f148b8e014c67ed40c18fa8d2f50aa5ee7d87d67-s1100-c50.jpg")
band_three.photo.attach(io: file, filename: "radiohead.png", content_type: "image/png")
band_three.save!

band_four = Band.new(name: "INXS",
  description: "INXS were an Australian rock band. The band became popular during the 1980s. They formed in Sydney, New South Wales, Australia in 1977. They did not get international attention until around 1982 when their third album came out.",
  genre: "Rock",
  user: User.fourth
)

file = URI.open("https://www.udiscovermusic.com/wp-content/uploads/2021/08/INXS-Getty-35237357-copy-1000x600.jpg")
band_four.photo.attach(io: file, filename: "inxs.png", content_type: "image/png")
band_four.save!

Booking.create!(start_time: DateTime.new(2019, 8, 10, 4, 10, 9), end_time: DateTime.new(2019, 8, 10, 8, 10, 9), user: User.first, band: Band.first)
Booking.create!(start_time: DateTime.new(2020, 2, 11, 5, 30, 9), end_time: DateTime.new(2020, 2, 11, 9, 30, 9), user: User.second, band: Band.second)
Booking.create!(start_time: DateTime.new(2020, 5, 9, 2, 15, 9), end_time: DateTime.new(2020, 5, 9, 6, 15, 9), user: User.third, band: Band.third)

Availability.create!(start_time: "1-8-2023", end_time: "18-8-2023", band: Band.first)
Availability.create!(start_time: "23-8-2023", end_time: "30-8-2023", band: Band.first)
Availability.create!(start_time: "1-9-2023", end_time: "20-9-2023", band: Band.first)
Availability.create!(start_time: "14-7-2023", end_time: "19-7-2023", band: Band.first)
Availability.create!(start_time: "1-7-2023", end_time: "7-7-2023", band: Band.first)
Availability.create!(start_time: "1-8-2023" , end_time: "11-8-2023", band: Band.second)
Availability.create!(start_time: "20-8-2023" , end_time: "29-8-2023", band: Band.second)
Availability.create!(start_time: "20-7-2023" , end_time: "29-7-2023", band: Band.second)
Availability.create!(start_time: "19-8-2023", end_time: "27-8-2023", band: Band.third)
Availability.create!(start_time: "5-8-2023", end_time: "13-8-2023", band: Band.third)
Availability.create!(start_time: "3-9-2023", end_time: "20-9-2023", band: Band.third)
Availability.create!(start_time: "5-8-2023", end_time: "13-8-2023", band: Band.fourth)
Availability.create!(start_time: "3-9-2023", end_time: "20-9-2023", band: Band.fourth)

puts "Seeding complete!"
