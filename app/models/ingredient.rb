class Ingredient
  include Mongoid::Document
  

  field :ingredient_name, type: String
  field :ingredient_quantity, type: Integer
  field :quantity_measure, type: String
  field :sign, type: String
end
