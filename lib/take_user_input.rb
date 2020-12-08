require_relative "create_sale_table"

module SaleStore
  SALE_ITEMS = {
    milk: CreateSaleTable.add_item("milk", 3.97, 5.00, 2),
    bread: CreateSaleTable.add_item("bread", 2.17, 6.00, 3),
    banana: CreateSaleTable.add_item("banana", 0.99, 0.00, 0),
    apple: CreateSaleTable.add_item("apple", 0.89, 0.00, 0),
  }

  p SALE_ITEMS

  def self.take_input
    puts "Please enter all the items purchased separated by a comma"

    input = gets.chomp!

    if input.empty?
      puts "Please place an order to continue."
      take_input
    else
      parse_str(input)
    end
  end

  def self.parse_str(str)
    items = str.downcase.split(",").collect { |item| item.gsub(/\s+/, "") }
    
    puts items, "items"
  end
end