class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.decimal :price_sm
      t.decimal :price_lg
      t.decimal :single_price

      t.timestamps
    end
  end
end
