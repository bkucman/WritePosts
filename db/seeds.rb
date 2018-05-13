# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create(name: :admin)
Role.create(name: :moderator)
Role.create(name: :simple_user)

user1 = User.create(
	username: 'Admin',
	email: 'admin@example.com',
	password: 'admin123',
	password_confirmation: 'admin123'
	)
user1.add_role(:admin)

user2 = User.create(
	username: 'Moderator',
	email: 'moderator@example.com',
	password: 'moderator123',
	password_confirmation: 'moderator123'
	)
user2.add_role(:moderator)

user3 = User.create(
	username: 'user',
	email: 'user@example.com',
	password: 'user123',
	password_confirmation: 'user123'
	)
user3.add_role(:simple_user)