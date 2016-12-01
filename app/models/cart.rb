class Cart < ApplicationRecord
  has_many  :line_items,  :dependent  =>  :destroy
  
  def  add_product(product_id)
    puts line_items
    puts "abcd"
    current_item  =  line_items.find_by_product_id(product_id)
    
    if  !current_item.blank?
      current_item.quantity  +=  1
  else

    current_item  =  line_items.build(:product_id  =>  product_id,  :order_id  =>  0)
  end
    current_item
end

def  total_price
  line_items.to_a.sum  {|item| item.total_price}
end

def  total_items
  line_items.sum(:quantity)
end
end
