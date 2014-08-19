class AddIndexToUsers < ActiveRecord::Migration
  def change
  	add_index :users,:userid
  end
end
