class ChangeStringFormatInRegistrations < ActiveRecord::Migration[5.0]
  def up
    change_column :registrations, :landingtime, :datetime
  end

  def down
    change_column :registrations, :landingtime, :string
  end
end
