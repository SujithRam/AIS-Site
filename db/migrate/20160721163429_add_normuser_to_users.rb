class AddNormuserToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :normuser, :boolean
  end
end
