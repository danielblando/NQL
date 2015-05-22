class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string      :name,                   :null => false
      t.string      :description
      t.integer     :theme_id,                :null => false
      
      t.timestamps
    end
  end
end
