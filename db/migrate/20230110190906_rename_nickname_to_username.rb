class RenameNicknameToUsername < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :nickname, :username
  end
end
