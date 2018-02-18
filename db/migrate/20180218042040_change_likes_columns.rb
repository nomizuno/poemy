class ChangeLikesColumns < ActiveRecord::Migration[5.1]
  def change
  	add_column :likes, :comment_user_id, :integer
  end
end
