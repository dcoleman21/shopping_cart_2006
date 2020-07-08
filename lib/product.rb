class Product
  attr_reader :category,
              :name,
              :unit_price,
              :quantity,
              :hoard

  def initialize(category, name, unit_price, quantity)
    @category   = category
    @name       = name
    @unit_price = unit_price.to_f
    @quantity   = quantity.to_i
    @hoard      = 0
  end

  def total_price
    (@unit_price * @quantity)
  end

  def is_hoarded?
    if @quantity <= 10
      return false
    elsif @quantity = 10
      return true
    end
  end

end
