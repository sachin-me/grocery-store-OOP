require_relative "item_with_discount"
require_relative "item_without_discount"

class CreateSaleTable
  def self.add_item(item_name, unit_price, discount_amount = 0, discount_qty = 0)
    case discount_qty
    when discount_qty >= 1
      ItemWithDiscount
    else
      ItemWithoutDiscount
    end.new(item_name, unit_price, discount_amount, discount_qty)
  end
end