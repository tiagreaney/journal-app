# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# this file generates entries for a Post with title, content, label and modifies the 

[Entry].each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table.table_name} RESTART IDENTITY CASCADE")
end

user = User.create(
    email: "tiagreaney@gmail.com",
    password: "1234",
)

10.times do
    entry = Entry.create(
        user: User.first,
        title: Faker::FunnyName.name,
        content: Faker::Quote.famous_last_words,
    )
    p "#{entry.title} "
end


p "#{user.email} "