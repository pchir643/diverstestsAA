puts 'Cleaning database...'
Product.destroy_all
Category.destroy_all

puts 'Creating categories...'
serv = Category.new(name: 'Service')
serv.save
arti = Category.new(name: 'Article')
arti.save
tran = Category.new(name: 'Transport')
tran.save

puts 'Creating products...'

50.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    price: rand(1000..10000)*1000.to_i.abs, 
    category_id: 1
  )
end
puts 'Finished!'

50.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    price: rand(100..1000)*100.to_i.abs,
    category_id: 2
  )
end
puts 'Finished!'

50.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    price: rand(10..50)*10.to_i.abs,
    category_id: 3
  )
end
puts 'Finished!'