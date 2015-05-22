class Forum < ActiveRecord::Base
  attr_accessible :name, :description, :theme_id

  has_many :theme
  belongs_to :forum
end
