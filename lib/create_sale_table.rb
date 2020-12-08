class CreateSaleTable
  def self.add_item(item_name, unit_price, discount_amount = 0, discount_qty = 0)
    case discount_qty
    when discount_qty >= 1
      return "discount items goes here..."
    else
      return "without discount items goes here..."
    end.new(item_name, unit_price, discount_amount, discount_qty)
  end
end