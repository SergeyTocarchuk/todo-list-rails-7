user = User.create(email: 'user@gmail.com', password: 'password', password_confirmation: 'password')
andrei = User.create(email: 'andrei@gmail.com', password: 'password', password_confirmation: 'password')
serghei = User.create(email: 'serghei@gmail.com', password: 'password', password_confirmation: 'password')
admin = User.create(email: 'admin@gmail.com', password: 'password', password_confirmation: 'password', admin: true)


groceries = List.create(name: 'Groceries', type_of_list: "project" )
work = List.create(name: 'Work', type_of_list: "project")
todo = List.create(name: 'To do today', type_of_list: "daily")
user.lists << groceries
user.lists << work
user.lists << todo

andrei.lists << List.create(name: "Andrei's Groceries", type_of_list: "project")
serghei.lists << List.create(name: "Serghei's Groceries", type_of_list: "project")

# 10.times do
#   groceries.items.create(content: Faker::Lorem.sentence )
# end
