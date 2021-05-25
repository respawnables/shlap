class AddUserIdToTitles < ActiveRecord::Migration[6.1]
  def change
    add_column :titles, :user_id, :integer
  end
end
