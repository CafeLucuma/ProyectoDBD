class AddFunctionaryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :functionary, :boolean, default: false
  end
end
