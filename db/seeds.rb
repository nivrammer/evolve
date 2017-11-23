# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserType.create(user_type: 'Admin')
UserType.create(user_type: 'Evotech Developer')
UserType.create(user_type: 'Client')
Company.create(code: '000000' ,name: 'Evotech Software Solutions', address_id: 1,tel_no: '613 1111 111')
