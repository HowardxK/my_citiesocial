# PORO = Plain Old Ruby Object
class Cart
  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def self.from_hash(hash = nil)
    if hash && hash["items"]
      items = hash["items"].map { |item|
        CartItem.new(item["sku_id"], item["quantity"])
      }
      Cart.new(items)
    else
      Cart.new
    end
  end

  def serialize
    # items = [
    #   {"sku_id" => 1, "quantity" => 3},
    #   {"sku_id" => 2, "quantity" => 2},
    # ]

    items = @items.map { |item| {"sku_id" => item.sku_id,
                                 "quantity" => item.quantity} }

    { "items" => items }
  end

  def add_sku(sku_id)
    found = @items.find { |item| item.sku_id == sku_id }
    # 找...
    if found
      found.increment!
    else
      @items << CartItem.new(sku_id)
    end
  end

  def empty?
    @items.empty?
  end

  def total_price
    @items.reduce(0) { |sum, item| sum = sum + item.total_price }
  end
end