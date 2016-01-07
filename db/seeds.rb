# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
o1 = Organization.create({ name: '--placeholder--', public_name: '--change-me-to-valid-org--', org_type: 'Show room', pricing_policy: 'Flexible' })
u1 = o1.users.create({ name: 'admin', password: 'admin', admin: true })