class RemovePromotionPriceFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :promotion_price, :float
  end
end
