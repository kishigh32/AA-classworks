# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do 

    Cat.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('cats')

    lucy = Cat.create!(name: 'Lucy', color: 'torty', sex: 'F', description: 'Old grumpy cat', birth_date: '03/02/2006')
    garfield = Cat.create!(name: 'Garfield', color: 'orange', sex: 'M', description: 'Hates Mondays', birth_date: '13/07/2002')
    mochi = Cat.create!(name: 'Mochi', color: 'brown', sex: 'F', description: 'Scary cat', birth_date: '10/9/2020')

end