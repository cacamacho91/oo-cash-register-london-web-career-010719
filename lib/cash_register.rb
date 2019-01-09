require 'pry'

class CashRegister
  attr_accessor :total,  :discount, :items, :last_transaction_cost

  def initialize(discount = 0, items = [])
    @total = 0
    @discount = discount
    @items = items
  end

  def add_item(name, price, quantity = 1)
    quantity.times {@items << name}
    @last_transaction_cost = price
    @total += (price*quantity)
  end

  def apply_discount
    if discount != 0
      @total = @total/100 * (100-@discount)
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction_cost
  end
end
