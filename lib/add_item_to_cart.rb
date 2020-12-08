require_relative "take_user_input"
require_relative "display_bill"

class AddItemToCart
  include SaleStore

  def initialize
    @orders = []
  end

  def checkout_item(display_bill: DisplayBill)
    @orders.length > 0 ? display_bill.new(@orders).bill : "Please place an order to continue."
  end

  def add_to_cart(items)
    unavailable_items, @orders = items.partition { |item| SaleStore::SALE_ITEMS[item.to_sym].nil? }

    puts "\n#{unavailable_items.join(", ")} is unavailable now." if unavailable_items.length > 0

    checkout_item
  end
end