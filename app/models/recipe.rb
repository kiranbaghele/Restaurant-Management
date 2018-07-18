class Recipe
  include Mongoid::Document





  field :image, type: String
  field :dish_name, type: String
  # field :ingredient_name, type: String
  # field :ingredient_quantity, type: Integer
  # field :quantity_measure, type: String
  field :sign, type: String
  field :recipe_direction, type: String
  field :price, type: Integer


  embeds_many :recipe_ingredient, class_name: "RecipeIngredient"
  mount_uploader :image, ImageUploader



  accepts_nested_attributes_for :recipe_ingredient, reject_if: proc {|attr| attr['ingredient_name'].blank?}, allow_destroy: true

  # has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def initialize_nested_attributes
    3.times do
      self.recipe_ingredient.build
    end
  end

end
