# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Comment.destroy_all
Tweet.destroy_all
User.destroy_all



#By default SQL String limit 255 character 
#Ex:- :limit => 40
user = User.create(username:"Teff", name: "Stephanny Vargas", email: "test@mail.com", password: "123456" )
puts user.persisted?
tweet = Tweet.create(body:"My very first tweet", user_id: user.id )
puts tweet.persisted?
comment = Comment.create(body: "My first comment", user: user, tweet: tweet)
puts comment.persisted?