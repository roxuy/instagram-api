class RenameNameToFullname < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :name, :fullname
  end
end
