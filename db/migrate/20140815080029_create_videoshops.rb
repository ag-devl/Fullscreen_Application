class CreateVideoshops < ActiveRecord::Migration
  def change
    create_table :videoshops do |t|
      t.string :name
      t.integer :videoid
      t.integer :views
      t.string :prerollads

      t.timestamps
    end
  end
end
