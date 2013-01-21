class AddFullNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string, :default => ""
  end
end
