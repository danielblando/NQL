class Database < ActiveRecord::Base
  attr_accessible :db_sql, :db_image

  belongs_to :snapshot
end
