class ChangeUsersColumn < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :poemy_id, :string
  end
end
