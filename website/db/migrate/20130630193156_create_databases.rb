class CreateDatabases < ActiveRecord::Migration
  def change
    create_table :databases do |t|
      t.text          :db_sql,         :null => false
      t.string        :db_image,       :null => false
      
      t.timestamps
    end
  end
end
