class Sale
  @@sales = {}

  def initialize(name, units, price)
    @@sales[name] = { 'units' => units, 'price' => price }
  end

  def self.all
    @@sales
  end
end
