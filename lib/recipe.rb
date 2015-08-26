class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :categories
  before_save(:capitalize_name)

  private

  define_method(:capitalize_name) do
    self.name=(name.capitalize)
  end
end
