require 'minitest/autorun'
require 'minitest/pride'
require './lib/pantry'
require './lib/ingredient'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
  end

  def test_it_exsits
    assert_instance_of Pantry, @pantry
  end

  def test_it_has_readable_attributes
    assert_equal ({}), @pantry.stock
  end

  def test_it_can_check_stock
    assert_equal 0, @pantry.stock_check(@ingredient1)
  end

  def test_it_can_restock
    assert_equal 0, @pantry.stock_check(@ingredient1)
    @pantry.restock(@ingredient1, 5)
    assert_equal 5, @pantry.stock_check(@ingredient1)
    @pantry.restock(@ingredient1, 10)
    assert_equal 15, @pantry.stock_check(@ingredient1)
  end
end
