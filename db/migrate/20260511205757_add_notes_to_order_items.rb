class AddNotesToOrderItems < ActiveRecord::Migration[8.1]
  def change
    add_column :order_items, :notes, :string
  end
end
