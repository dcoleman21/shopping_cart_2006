class ShoppingCart
  attr_reader :name,
              :capacity,
              :products

  def initialize(name, capacity)
    @name     = name
    @capacity = capacity.to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    expected = {
      name: @name,
      capacity: @capacity
    }
  end

  def total_number_of_products
    @products.sum do |product|
      product.quantity
    end
  end

  def is_full?
    if total_number_of_products <= 13
      return false
    elsif total_number_of_products > 13
      return true
    end
  end

  def products_by_category(category)
    @products.find_all do |product|
      product.category == category
    end
  end
end
