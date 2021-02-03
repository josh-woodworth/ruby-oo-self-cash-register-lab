require 'pry'
class CashRegister

    attr_accessor :discount, :total, :quantity, :items, :values, :price

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @values = []
    end
    def add_item(title, price, quantity = 1)
        @price = price
        @total += (price * quantity)
        @values << price
        quantity.times do
        @items << title
        end
    end

    def apply_discount
       if @discount != 0
       self.total -= @total * @discount / 100
       return "After the discount, the total comes to $#{self.total}."
       else
        return "There is no discount to apply."
       end
    end

    def items
        @items
    end

    def void_last_transaction
        sum = 0
        @values[0...-1].each do |items|
            sum = sum + items
        end
        @total = sum
    end
end
# binding.pry