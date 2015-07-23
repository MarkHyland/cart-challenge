require 'pry'

class Item 
  attr_reader :name, :price

  def initialize name, price
    @name, @price = name, price
  end
end

class Cart
  attr_reader :tax_rate

  def initialize options=nil 
    @items = []
    if options
      @tax_rate = options[:tax_rate]
    else
      @tax_rate = 10
    end
  end

  def add_item item
    @items.push item
  end

  def item_count
    @items.count 
  end

  def contains? item
    @items.include? item
  end

  def value
    sum = 0
    @items.each do |item|
      sum = sum + item.price
    end
    sum
  end

  def cost_before_tax
    value
  end

  def cost_after_tax
    value + value * @tax_rate / 100
  end
end