class Recipe < ActiveRecord::Base
  has_and_belongs_many :ingredients
  has_and_belongs_many :categories
end
