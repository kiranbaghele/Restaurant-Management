class RecipeIngredient
  include Mongoid::Document


  # field :recipe_image, type: String
  field :ingredient_name, type: String
  field :ingredient_id, type: String
  field :ingredient_quantity, type: Integer
  field :quantity_measure, type: String
  field :sign, type: String


  embedded_in :recipe, class_name: "Recipe"

end
