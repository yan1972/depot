class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id
  
  belongs_to :product
  belongs_to :cart
  
  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(:product_id => product_id)
    end
  end
  
end
