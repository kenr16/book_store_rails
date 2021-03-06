Book.destroy_all
User.destroy_all
Account.destroy_all
Order.destroy_all
OrderItem.destroy_all

user = User.create!(name: "Admin", email: "admin@email.com", password: "password", password_confirmation: "password")
user.update_attribute :admin, true
user.account = Account.create(name: "Admin")
user.account.orders.create!

# user.account.orders.create

50.times do |index|
  Book.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph(3, true, 2),
    length: Faker::Number.between(100, 760),
    stock: Faker::Number.between(10, 30),
    price: Faker::Commerce.price,
    author: Faker::Book.author,
    img_src: "cover.jpg"
  )
end
