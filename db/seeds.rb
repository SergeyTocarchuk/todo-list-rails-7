user = User.create(email: 'user@gmail.com', password: 'password', password_confirmation: 'password')
andrei = User.create(email: 'andrei@gmail.com', password: 'password', password_confirmation: 'password')
serghei = User.create(email: 'serghei@gmail.com', password: 'password', password_confirmation: 'password')
admin = User.create(email: 'admin@gmail.com', password: 'password', password_confirmation: 'password', admin: true)


groceries = List.create(name: 'Groceries')
work = List.create(name: 'Work')
user.lists << groceries
user.lists << work


andrei.lists << List.create(name: 'Andreis Groceries')
serghei.lists << List.create(name: 'Sergehis Groceries')

# 1000.times do
#   List.create(name: Faker::Lorem.sentence )
# end
