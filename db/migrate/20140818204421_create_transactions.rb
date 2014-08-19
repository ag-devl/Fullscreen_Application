class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :userid
      t.integer :videoid
      t.integer :likes
      t.integer :dislikes
      t.boolean :skip_ad

      t.timestamps
    end
  end
end
