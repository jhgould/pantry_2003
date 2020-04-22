require './lib/recipe'

class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def highest_calorie_meal
    recipes_with_cals = {}
    @recipes.each do |recipe|
      recipes_with_cals[recipe] = recipe.total_calories
    end
    highest = recipes_with_cals.max_by do |recipe, calories|
      calories
    end
    highest.shift
  end


end
