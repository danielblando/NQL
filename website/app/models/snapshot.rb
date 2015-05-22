class Snapshot < ActiveRecord::Base
  attr_accessible :db_id, :description, :user_id
  
  has_many :database
  has_many :user
  belongs_to :interaction
end
