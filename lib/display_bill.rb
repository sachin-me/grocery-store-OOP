class DisplayBill
  def initialize(items)
    @items = items
    @total_purchased_amount = 0
    @total_saved_amount = 0
  end

  def print_bill
    str = "\n\nTotal price : $#{@total_purchased_amount}", "You saved $#{@total_saved_amount} today.\n\n"

  end

  def bill
    total_purchased_amount, total_saved_amount = @orders.keys.inject([0, 0]) do |amount, item_name|
      total_purchased_price, saved_price = SaleStore::SALE_ITEMS[item_name.to_sym].purchased_amount(@items[item_name])

      amount[0] += total_purchased_price
      amount[1] += saved_price

      amount
    end
    @total_purchased_amount = total_purchased_amount.round(2)
    @total_saved_amount = total_saved_amount.round(2)

    print_bill
  end
end