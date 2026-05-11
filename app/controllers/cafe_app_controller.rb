class CafeAppController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :create_order ]

  def home
    @coffee_and_tea = Product.where(category: "Coffee & Tea")
    @hot_espresso   = Product.where(category: "Hot Espresso")
    @iced_espresso  = Product.where(category: "Iced Espresso")
    @smoothies      = Product.where(category: "Smoothies")
    @addons         = Product.where(category: "Add-ons")
  end

  def create_order
    order = Order.create!(
      customer_name: params[:customer_name],
      total: params[:total],
      status: "In Progress"
    )

    if params[:items].present?
      params[:items].each do |item|
        product = Product.find_by(name: item[:name])

        if product
          OrderItem.create!(
            order: order,
            product: product,
            size: item[:size],
            quantity: item[:qty]
          )
        end
      end
    end

    render json: { success: true, order_id: order.id }
  end
end
