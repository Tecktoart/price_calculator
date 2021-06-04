class BillPrinter
  def initialize(bill:)
    @bill = bill
  end

  def print
    print_header
    print_rows
    print_total
  end

  private

  attr_reader :bill

  def print_header
    puts "Item     Quantity      Price"
    puts "--------------------------------------"
  end

  def print_rows
    bill.rows.each do |row|
      puts "#{row.name.ljust(10)} #{row.quantity}           $#{row.discounted_total.round(3)}"
    end
  end

  def print_total
    puts "Total price : $#{bill.discounted_total.round(3)}"
    puts "You saved $#{(bill.total - bill.discounted_total).round(3)} today."
  end
end