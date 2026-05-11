class CafeAppController < ApplicationController
  def home
    # We grab the products from the database and group them by category
    @coffee_and_tea = Product.where(category: "Coffee & Tea")
    @hot_espresso   = Product.where(category: "Hot Espresso")
    @iced_espresso  = Product.where(category: "Iced Espresso")
    @smoothies      = Product.where(category: "Smoothies")
    @addons         = Product.where(category: "Add-ons")
  end
end
