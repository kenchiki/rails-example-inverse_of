# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Blog.destroy_all

Blog.create!(title: 'blog1', articles_attributes: [{ title: 'article1', description: "test test2." }, { title: 'article2', description: "test test2." }])
Blog.create!(title: 'blog2', articles_attributes: [{ title: 'article3', description: "test test2." }])
