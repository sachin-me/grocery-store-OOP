class ItemWithDiscount
  attr_reader :item_name, :unit_price, :discount_amount, :discount_qty

  def initialize(item_name, unit_price, discount_amount, discount_qty)
    @item_name = item_name
    @unit_price = unit_price
    @discount_amount = discount_amount
    @discount_qty = discount_qty
  end

  def actual_purchased_amount(qty)
    qty * @unit_price
  end

  def total_purchased_amount(qty)
    ((qty / @discount_qty) * @discount_amount) + ((qty % @discount_qty) * @unit_price)
  end

  def purchased_amount(qty)
    total_discounted_amount = actual_purchased_amount(qty) - total_purchased_amount(qty)

    [total_purchased_amount(qty), total_discounted_amount]
  end

end