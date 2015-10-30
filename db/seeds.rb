# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  
  User.create([{email: 'don@nbk.com'},{encrypted_password:'123456789'},{first_name: 'don'},{last_name:'mailer'}, {depertment:'mail'},{role:'mailroom'}])
  User.create([{email: 'don1@nbk.com'},{encrypted_password:'123456789'},{first_name: 'don1'},{last_name:'mailer1'}, {depertment:'mail'},{role:'mailroom'}])
  User.create([{email: 'don2@nbk.com'},{encrypted_password:'123456789'},{first_name: 'don2'},{last_name:'mailer2'}, {depertment:'ICT'},{role:'other'}])
  User.create([{email: 'don3@nbk.com'},{encrypted_password:'123456789'},{first_name: 'don3'},{last_name:'mailer3'}, {depertment:'cooperate'},{role:'other'}])
  User.create([{email: 'don4@nbk.com'},{encrypted_password:'123456789'},{first_name: 'don4'},{last_name:'mailer4'}, {depertment:'legal'},{role:'other'}])
  User.create([{email: 'don5@nbk.com'},{encrypted_password:'123456789'},{first_name: 'don5'},{last_name:'mailer5'}, {depertment:'hr'},{role:'other'}])