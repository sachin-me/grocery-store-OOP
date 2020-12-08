class ItemWithoutDiscount
  attr_reader :item_name, :unit_price
  
  def initialize(item_name, unit_price, discount_amount, discount_qty)
    @item_name = item_name
    @unit_price = unit_price
  end

  def purchased_amount(qty)
    [(qty * @unit_price), 0]
  end
end