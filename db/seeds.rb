# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Band.destroy_all
User.destroy_all

# Create Users
User.create!()

# Create Bands
Band.create!(name: "Pink Floyd",
  description: "An English rock band that became famous in the 1960s and 1970s. They performed for more than 30 years, and have sold more than 200 million albums.",
  genre: "Rock",
  photo_url:"https://upload.wikimedia.org/wikipedia/id/thumb/f/f3/PinkFloyd-album-piperatthegatesofdawn.jpg/640px-PinkFloyd-album-piperatthegatesofdawn.jpg",
  user: User.first
)
Band.create!(name: "Chicago", description: "One of the famous American jazz rock bands formed in Chicago, Illinois, in 1967.", genre: "Jazz", photo_url:"https://upload.wikimedia.org/wikipedia/commons/1/16/ChicagoCollage2-1000.jpg")
Band.create!(name: "Radiohead", description: "An English alternative rock band formed in Abingdon, Oxfordshire, in 1985.", genre: "Alternative Rock", photo_url: "https://live-production.wcms.abc-cdn.net.au/a6eb12a0e9689d04723c929c37816b6d?impolicy=wcms_crop_resize&cropH=506&cropW=759&xPos=71&yPos=0&width=862&height=575")
