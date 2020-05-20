# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin_role = Role.create!(name: "admin")
non_admin_role = Role.create!(name: "non_admin")

org1 = Organization.create!(name: "admin")
org2 = Organization.create!(name: "Wipro")
org3 = Organization.create!(name: "Infosys")
org4 = Organization.create!(name: "CTS")


user1 = User.create!(email: "admin@tweet.com", password: "12345678", password_confirmation: "12345678", organization_id: org1.id)
Permission.create!(user_id: user1.id, role_id: admin_role.id)

user2 = User.create!(email: "user@tweet.com", password: "12345678", password_confirmation: "12345678", organization_id: org2.id)
Permission.create!(user_id: user2.id, role_id: non_admin_role.id)

user3 = User.create!(email: "user2@tweet.com", password: "12345678", password_confirmation: "12345678", organization_id: org2.id)
Permission.create!(user_id: user2.id, role_id: non_admin_role.id)
