class AddAddonTotalToOrderItems < ActiveRecord::Migration[8.1]
  def change
    add_column :order_items, :addon_total, :decimal
  end
end
