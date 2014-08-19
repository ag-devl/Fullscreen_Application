class AddIndexToVideos < ActiveRecord::Migration
  def change
  	add_index :videoshops, :videoid
  end
end
