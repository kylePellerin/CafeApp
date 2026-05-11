# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Clearing old menu items..."
Product.destroy_all

puts "Brewing fresh menu items..."

# Coffee & Tea
Product.create!([
  { name: "Hot Coffee", category: "Coffee & Tea", price_sm: 2.50, price_lg: 3.00 },
  { name: "Cold Brew", category: "Coffee & Tea", price_sm: 3.50, price_lg: 4.00 },
  { name: "Chai Latte", category: "Coffee & Tea", price_sm: 4.25, price_lg: 4.75 },
  { name: "Iced Chai Latte", category: "Coffee & Tea", price_sm: 5.00, price_lg: 6.00 },
  { name: "Matcha Latte", category: "Coffee & Tea", price_sm: 4.00, price_lg: 5.50 },
  { name: "Iced Matcha Latte", category: "Coffee & Tea", price_sm: 4.50, price_lg: 5.50 },
  { name: "Café Au Lait", category: "Coffee & Tea", price_sm: 3.00, price_lg: 3.50 },
  { name: "Hot Chocolate", category: "Coffee & Tea", price_sm: 1.75, price_lg: 2.50 },
  { name: "London Fog Latte", category: "Coffee & Tea", price_sm: 2.00, price_lg: 3.00 },
  { name: "Iced London Fog", category: "Coffee & Tea", price_sm: 2.50, price_lg: 3.25 },
  { name: "Hot Tea", category: "Coffee & Tea", single_price: 2.00 },
  { name: "Iced Tea", category: "Coffee & Tea", single_price: 2.50 }
])

# Hot Espresso
Product.create!([
  { name: "Espresso Shot", category: "Hot Espresso", price_sm: 1.00, price_lg: 2.00 },
  { name: "Americano", category: "Hot Espresso", price_sm: 2.50, price_lg: 3.00 },
  { name: "Latte", category: "Hot Espresso", price_sm: 4.00, price_lg: 4.50 },
  { name: "Cappuccino", category: "Hot Espresso", price_sm: 4.00, price_lg: 4.50 },
  { name: "Mocha Latte", category: "Hot Espresso", price_sm: 4.50, price_lg: 5.50 }
])

# Iced Espresso
Product.create!([
  { name: "Iced Americano", category: "Iced Espresso", price_sm: 3.00, price_lg: 3.50 },
  { name: "Iced Latte", category: "Iced Espresso", price_sm: 4.50, price_lg: 5.00 },
  { name: "Iced Mocha Latte", category: "Iced Espresso", price_sm: 4.75, price_lg: 5.75 }
])

# Smoothies
Product.create!([
  { name: "Sunrise Smoothie", category: "Smoothies", single_price: 4.50 },
  { name: "Fruit Smoothie", category: "Smoothies", single_price: 5.50 }
])

# Add-ons (Stored as products with a special category)
Product.create!([
  { name: "Add Banana", category: "Add-ons", single_price: 1.00 },
  { name: "Add Protein Powder", category: "Add-ons", single_price: 4.00 }
])

puts "Success! Added #{Product.count} items to the menu."
