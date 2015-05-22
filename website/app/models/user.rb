class User < ActiveRecord::Base
  attr_accessible :name, :email, :password
 
  belongs_to :snapshot
  belongs_to :interaction
end
