require "terminal-table"

class DisplayBill
  def initialize(items)
    @items = items
    @total_purchased_amount = 0
    @total_saved_amount = 0
    @receipt_data = []
  end

  def print_receipt_data
    table = Terminal::Table.new :headings => ["Item", "Quantity", "Price"], :rows => @receipt_data
    table.style = {
      width: 50,
      border_x: "-",
      border_i: "",
      border_y: "",
      border_top: false,
      border_bottom: false,
      all_separators: false,
    }
    table
  end

  def print_bill
    str = "\n\nTotal price : $#{@total_purchased_amount}", "You saved $#{@total_saved_amount} today.\n\n"
    puts "\n", print_receipt_data, str
  end

  def bill
    total_purchased_amount, total_saved_amount = @items.keys.inject([0, 0]) do |amount, item_name|
      total_purchased_price, saved_price = SaleStore::SALE_ITEMS[item_name.to_sym].purchased_amount(@items[item_name])

      amount[0] += total_purchased_price
      amount[1] += saved_price

      @receipt_data << [item_name.capitalize, @items[item_name], "$#{total_purchased_price.round(2)}"]
      amount
    end
    @total_purchased_amount = total_purchased_amount.round(2)
    @total_saved_amount = total_saved_amount.round(2)

    print_bill
  end
end