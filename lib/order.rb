require_relative "menu"

class Order
  
  attr_reader :order

  def initialize(menu_class = Menu)
    @menu_class = menu_class
    @menu = ""
    @order = []
  end

  def see_menu
    @menu = @menu_class.new
    @menu.check_menu
  end

  def add(dish)
    @order << dish
    "You now have #{@order.count(dish)} of the #{dish} meal in your order"
  end

  def check_total
    total = 0
    @order.each { |dish|
      puts "#{dish} - £#{Menu.new.get_price(dish)}" 
      total += Menu.new.get_price(dish)
    }
    puts "-" * 15
    puts "Total - £#{total}"

  end
end
