class CreateSnapshots < ActiveRecord::Migration
  def change
    create_table :snapshots do |t|
      t.integer :user_id
      t.string  :description,      :null => true
      t.integer :db_id

      t.timestamps
    end
  end
end
