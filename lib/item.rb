class Item
  @@items = {}

  def initialize(name, price)
    @@items[name] = price
  end

  def self.all
    @@items
  end
end
