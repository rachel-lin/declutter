# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create Users

10.times do
  user = User.new(
    name:  Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10) 
    )
  user.skip_confirmation!
  user.save!
end

users = User.all

# Create Items

100.times do
  Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence,
    )
end

items = Item.all



# USERS
# USERS
# USERS
# USERS

admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  # role: 'admin'
  )
admin.skip_confirmation!
admin.save!

# Create a moderator

moderator = User.new(
  name: 'Moderator User',
  email: 'moderator@example.com',
  password: 'helloworld',
  # role: 'moderator'
  )
moderator.skip_confirmation!
moderator.save!

# Create a member

member = User.new(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld'
  )

member.skip_confirmation!
member.save!


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"