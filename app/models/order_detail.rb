class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: { waiting_for_payment: 0, payment_confirmation: 1, production: 2, shipping_preparation: 3, sent:4 }
  
end
