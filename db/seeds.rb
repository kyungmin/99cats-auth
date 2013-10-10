# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


cat1 = Cat.create([{name: "Kiki", age: 2, birth_date: Date.parse("1988/09/21"), color: "blue", sex: "F"}])

cat2 = Cat.create([{name: "KK", age: 3, birth_date: Date.parse("1988/09/21")), color: "black", sex: "F"}])
