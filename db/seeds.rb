# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
toy1 = Toy.create!(name: "lego", price: 10, image: "test")

toy2 = Toy.create!(name: "yo-yo", price: 20, image: "test")

toy3 = Toy.create!(name: "ball", price: 5, image: "test")
