class Restaurant
  include Mongoid::Document

  belongs_to :user

  field :name, type: String
  field :sign, type: String
  field :price, type: Integer
  field :user_id, type: String
end
