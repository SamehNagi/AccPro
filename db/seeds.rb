# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


account_types = [{:type => 'Assets'},
    	  {:title => 'Liabilities'},
    	  {:title => 'Equity'},
      	  {:title => 'Expenses'}]

account_types.each do |type|
  AccountType.create!(type)
end
