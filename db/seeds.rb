Book.destroy_all
User.destroy_all
Account.destroy_all
Order.destroy_all
OrderItem.destroy_all

user = User.create!(email: "admin@gmail.com", password: "password", password_confirmation: "password")
user.update_attribute :admin, true

user.account = Account.create(name: "Administrator")

user.account.orders.create!

# user.account.orders.create

50.times do |index|
  Book.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.sentence(3, true, 2),
    length: Faker::Number.between(100, 760),
    stock: Faker::Number.between(10, 30),
    price: Faker::Commerce.price
  )
end
