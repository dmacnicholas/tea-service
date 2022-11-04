# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
customer1 = Customer.create!(first_name: 'Liam', last_name: 'Jones', email: 'liam@example.com', address: '123 Main Street')
customer2 = Customer.create!(first_name: 'Stella', last_name: 'James', email: 'stella@example.com', address: '456 Main Street')

tea1 = Tea.create!(title: 'Black Tea', description: 'Good', temperature: 75, brew_time: '52')
tea2 = Tea.create!(title: 'Green Tea', description: 'Great', temperature: 90, brew_time: '21')
tea3 = Tea.create!(title: 'Hibiscus', description: 'Amazing', temperature: 82, brew_time: '17')

subscription1 = Subscription.create!(title: 'Monthly', price: 30.00, status: "Active", frequency: 'Monthly', customer_id: customer1.id, tea_id: tea1.id)
subscription2 = Subscription.create!(title: 'Monthly', price: 30.00, status: "Cancelled", frequency: 'Monthly', customer_id: customer1.id, tea_id: tea2.id)
subscription3 = Subscription.create!(title: 'Weekly', price: 12.00, status: "Active", frequency: 'Weekly', customer_id: customer1.id, tea_id: tea3.id)
