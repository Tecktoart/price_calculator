class Bill
  def initialize(purchased_items:)
    @purchased_items = purchased_items
  end

  def total
    rows.inject(0) { |sum, x| sum + x.total }
  end

  def discounted_total
    rows.inject(0) { |sum, x| sum + x.discounted_total }
  end

  def rows
    @rows ||= fetch_rows
  end

  private

  attr_reader :purchased_items

  def fetch_rows
    count_items.map do |item, quantity|
      BillRow.new(name: item, quantity: quantity)
    end
  end

  def count_items
    purchased_items.inject(Hash.new(0)) do |quantity, item|
      quantity[item] += 1
      quantity
    end
  end
end
