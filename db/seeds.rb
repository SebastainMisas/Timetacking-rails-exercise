# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

proj = Project.create(name: "random", description: "test")
proj2 = Project.create(name: "random2",description: "test2")
proj3 = Project.create(name: "random3", description: "test3")
proj4 = Project.create(name: "random4", description: "test4")

proj.entries.create(hours: 4, minutes: 43)
proj.entries.create(hours: 4, minutes: 43)
proj2.entries.create(hours: 5, minutes: 50)
proj2.entries.create(hours: 5, minutes: 50)
proj3.entries.create(hours: 6, minutes: 34)
proj3.entries.create(hours: 6, minutes: 34)
proj4.entries.create(hours: 8, minutes: 24)
proj4.entries.create(hours: 8, minutes: 24)
