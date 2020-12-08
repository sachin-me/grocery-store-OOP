require_relative "take_user_input"

class AddItemToCart
  include SaleStore

  def initialize
    @orders = []
  end

  def add_to_cart(items)
    unavailable_items, @orders = items.partition { |item| SaleStore::SALE_ITEMS[item.to_sym].nil? }

    puts "\n#{unavailable_items.join(", ")} is unavailable now." if unavailable_items.length > 0
  end
end