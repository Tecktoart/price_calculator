require_relative 'lib/item'
require_relative 'lib/sale'
require_relative 'lib/bill'
require_relative 'lib/bill_row'
require_relative 'lib/input_handler'
require_relative 'lib/bill_printer'

class PriceCalculator
  def call
    if purchased_items.any?
      bill_printer.print
    else
      puts "Please add items to cart"
    end
  end

  private

  def bill_printer
    @bill_printer ||= BillPrinter.new(bill: bill)
  end

  def bill
    Bill.new(purchased_items: purchased_items)
  end

  def purchased_items
    @purchased_items ||= input.split(',').map(&:strip)
  end

  def input
    InputHandler.new('Please enter all the items purchased separated by a comma').call
  end
end


Item.new('milk', 3.97)
Item.new('bread', 2.17)
Item.new('banana', 0.99)
Item.new('apple', 0.89)

Sale.new('milk', 2, 5.00)
Sale.new('bread', 3, 6.00)

puts PriceCalculator.new.call
