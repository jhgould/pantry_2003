require 'minitest/autorun'
require 'minitest/pride'
require './lib/pantry'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
  end

  def test_it_exsits
    assert_instance_of Pantry, @pantry
  end

  def test_it_has_readable_attributes
    assert_equal ({}), @pantry.stock
  end
end
