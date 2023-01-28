class Order < ApplicationRecord
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_payment: 0, payment_confirmation: 1, production: 2, shipping_preparation: 3, sent:4 }
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  
  def total_amount
    total = 0
    order_details.each do |order_detail|
      total = total + order_detail.amount
    end
    return total
  end
  
end
