class Order < ApplicationRecord
  has_many  :line_items,  :dependent  =>  :destroy
  PAYMENT_TYPES  =  ["Check",  "Credit  card",  "Purchase order"]
  validates  :name,  :province,  :city,  :district,  :email,  :pay_type,  :presence  =>  true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates  :email,  format: { with: VALID_EMAIL_REGEX }
  validates   :pay_type,  :inclusion  =>  PAYMENT_TYPES
  validates :province,  :city,  :district, format: { with: /^(\d)*$/ ,  :multiline => true  }
  
  def  self.p_t
    ["Check",  "Credit  card",  "Purchase order"]
  end
  def  add_line_items_form_cart(cart)
    cart.line_items.each  do  |item|
    item.cart_id  =  nil
    line_items  <<  item
    end
  end
end
