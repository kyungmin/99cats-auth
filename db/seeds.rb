# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Cat.create([{name: "Kiki", age: 2, birth_date: Date.parse("1988/09/21"), color: "blue", sex: "F"}])

Cat.create([{name: "kitty", age: 3, birth_date: Date.parse("1988/09/21"), color: "black", sex: "F"}])


CatRentalRequest.create([{cat_id: 2, start_date: Date.parse("2013/09/21"), end_date: Date.parse("2013/10/21")}])

#overlapping request
# CatRentalRequest.create([{cat_id: 2, start_date: Date.parse("2013/09/30"), end_date: Date.parse("2013/10/21")}])

CatRentalRequest.create([{cat_id: 2, start_date: Date.parse("2013/10/30"), end_date: Date.parse("2013/11/21")}])

CatRentalRequest.create([{cat_id: 1, start_date: Date.parse("2013/10/30"), end_date: Date.parse("2013/11/21")}])


User.create([{user_name: "vincent", password: "kiki"}])
User.create([{user_name: "kyungminkk", password: "Kiki"}])
