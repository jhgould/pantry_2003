require 'minitest/autorun'
require 'minitest/pride'
require './lib/pantry'
require './lib/ingredient'
require './lib/cook_book'
require './lib/recipe'



class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @cookbook = CookBook.new

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

  def test_it_has_enough
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    assert_equal false, @pantry.enough_ingredients_for?(@recipe1)
    @pantry.restock(@ingredient2, 7)
    @pantry.restock(@ingredient2, 1)
    assert_equal true, @pantry.enough_ingredients_for?(@recipe1)
  end
end
