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

  def staff
    @active_orders = Order.where(status: "In Progress")
                          .order(created_at: :asc)
                          .includes(order_items: :product)
  end

  def complete_order
    order = Order.find(params[:id])
    order.update(status: "Completed")

    redirect_to staff_path, notice: "Order for #{order.customer_name} is ready!"
  end
end
