class ChangeLikesColums < ActiveRecord::Migration[5.1]
  def change
  	remove_column :likes, :comment_user_id, :integer
  end
end
