class CreateSaleTable
  def self.add_item(item_name, unit_price, discount_amount = 0, discount_qty = 0)
    if discount_qty >= 1
      puts "discount items goes here..."
    else
      puts "without discount items goes here..."
    end.new(item_name, unit_price, discount_amount, discount_qty)
  end
end