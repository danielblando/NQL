class Interaction < ActiveRecord::Base
  attr_accessible :user_id, :snap_id, :upper_interaction, :description, :forum_id

  belongs_to :interaction
  has_many :interaction
  has_many :snapshot
  has_many :forum
  has_many :user
end
