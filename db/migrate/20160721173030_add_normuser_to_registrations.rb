class AddNormuserToRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :normuser, :boolean, :default => false
  end
end
