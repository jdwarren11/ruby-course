require 'time' # you're gonna need it

class Bar
  attr_reader :name
  attr_writer :happy_discount
  attr_accessor :menu_items

  def initialize(name)
    @name = name
    @menu_items = []
    @happy_discount = 0
  end

  def add_menu_item(name, price)
    menu_item = MenuItem.new(name, price)
    @menu_items << menu_item
  end 

  def happy_hour?
    t = Time.now
    if t.hour == 15
      true
    else
      false
    end
  end

  def happy_discount
    if happy_hour?
        @happy_discount
    else
      0
    end
  end

  def happy_discount=(discount)
    if discount > 1
      @happy_discount = 1
    elsif discount < 0
      @happy_discount = 0
    end
  end


end

class MenuItem
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end