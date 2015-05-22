class Theme < ActiveRecord::Base
  attr_accessible :name, :description

  belongs_to :forum
end
