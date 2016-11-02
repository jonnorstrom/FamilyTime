# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: 'password', is_admin: true)

u2 = User.create(first_name: "John", last_name: "Doe", email: "johndoe@email.com", password: 'password', is_admin: false)

thanksgiving = Vacation.create(name: "Thanksgiving", location: "Dublin, Ohio")
thanksgiving.update(start: Date.parse('24-11-2016'), end: Date.parse('24-11-2016'))

thanksgiving.topics.first.comments.create(content: "Well I'd love to host everyone!", user_id: u1.id)

thanksgiving.topics.first.comments.create(content: "Sounds great to me.", user_id: u2.id)

thanksgiving.topics[1].comments.create(content: "I'll bring the turkey", user_id: u1.id)

thanksgiving.topics[1].comments.create(content: "Great! And I'll bring some pie.", user_id: u2.id)

thanksgiving.topics.first.update(is_open: false)

christmas = Vacation.create(name: "Christmas")

christmas.topics.first.comments.create(content: "Should we all get together the week before Christmas or the week after?", user_id: u2.id)

christmas.topics[2].comments.create(content: "If there's a bunk bed, I call top!", user_id: u1.id)
