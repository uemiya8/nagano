module Admin::ItemsHelper
  def include_tax(price)
    (price * 1.1).floor
  end
  
  def delimited(price)
    price.to_s(:delimited)
  end
end
