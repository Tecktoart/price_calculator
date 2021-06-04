class BillRow
  attr_reader :name, :quantity

  def initialize(name:, quantity:)
    @name = name
    @quantity = quantity
  end

  def total
    @total ||= quantity * item_price
  end

  def discounted_total
    @discounted_total ||= calculate_discounted_total || total
  end

  private

  def calculate_discounted_total
    return unless sale

    (quantity / sale['units'] * sale['price']) + (quantity % sale['units'] * item_price)
  end

  def sale
    @sale ||= Sale.all[name]
  end

  def item_price
    Item.all[name]
  end
end
