anthony = User.create!(
  email: 'anthony@food_on_rails.com',
  password: '123123'
)

charlotte = User.create!(
  email: 'charlotte@food_on_rails.com',
  password: '123123'
)


Restaurant.create!(
  name: "Henry's Burger",
  address: '123 Meguro',
  user: anthony
)

Restaurant.create!(
  name: "Ruben's Ramen",
  address: '456 Meguro',
  user: charlotte
)
