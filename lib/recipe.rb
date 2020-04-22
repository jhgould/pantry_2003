require 'pry';

class Recipe

  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
  end

  def ingredients
    ingredient_list = []
    @ingredients_required.each do |ingredient, amount|
      ingredient_list << ingredient
    end
    ingredient_list
  end

  def total_calories
    @ingredients_required.sum do |ingredient, amount|
      ingredient.calories * amount
    end
  end

end
