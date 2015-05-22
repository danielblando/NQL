class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.integer   :user_id,            :null => false
      t.integer   :snap_id,            :null => true
      t.integer   :upper_interaction   
      t.string    :description
      t.integer   :forum_id
      
      t.timestamps
    end
  end
end
