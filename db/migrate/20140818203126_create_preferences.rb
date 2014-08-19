class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :userid
      t.integer :videoid
      t.boolean :likes
      t.boolean :dislikes

      t.timestamps
    end
  end
end
