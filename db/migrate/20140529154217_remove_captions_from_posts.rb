class RemoveCaptionsFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :captions
  end
end
