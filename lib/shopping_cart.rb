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
    {name: @name, capacity: @capacity}
    # {name: self.name, capacity: self.capacity} this also works
  end

  def total_number_of_products
    @products.sum do |product|
      product.quantity
    end
  end

  def is_full?
    total_number_of_products >= @capacity
  end

  def products_by_category(category)
    @products.find_all do |product|
      product.category == category
    end
  end

  def percentage_occupied
    (total_number_of_products / @capacity.to_f * 100).round(2)
  end

  def sorted_products_by_quantity
    @products.sort_by do |product|
      product.quantity
    end.reverse
  end

  def product_breakdown
    result = Hash.new { |hash, key| hash[key] = []}
    @products.each do |product|
      result[product.category] << product
    end
    result
  end
end
