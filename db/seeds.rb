# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer_1 = Customer.create(
    first_name: "Bob", 
    last_name: "McBobster",
    email: "bob@mcbobster.com", 
    address: "123 ABC St, Charlotte NC, 28226"
)
customer_1.subscriptions.create(
    title: "beginner",
    price: 15,
    status: 1,
    frequency: 1
)
customer_1.subscriptions.create(
    title: "beginner",
    price: 15,
    status: 0,
    frequency: 2
)

customer_2 = Customer.create(
    first_name: "Alice", 
    last_name: "McAlister",
    email: "alice@mcalisterster.com", 
    address: "911 Golden St, Beverly Hills CA, 90210"
)
customer_2.subscriptions.create(
    title: "advanced",
    price: 30,
    status: 1,
    frequency: 2
)
customer_2.subscriptions.create(
    title: "expert",
    price: 60,
    status: 0,
    frequency: 1
)

customer_3 = Customer.create(
    first_name: "Charlie", 
    last_name: "McCharles",
    email: "charlie@mccharles.com", 
    address: "711 Stewart St, Galveston TX, 77007"
)
customer_3.subscriptions.create(
    title: "expert",
    price: 60,
    status: 0,
    frequency: 2
)
customer_3.subscriptions.create(
    title: "advanced",
    price: 30,
    status: 0,
    frequency: 1
)
customer_3.subscriptions.create(
    title: "beginner",
    price: 15,
    status: 0,
    frequency: 4
)