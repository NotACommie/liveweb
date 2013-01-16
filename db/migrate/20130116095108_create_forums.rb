class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name
      t.string :description
      t.integer :forum_id

      t.timestamps
    end
  end
end
