class AddMemberToUtsavSeat < ActiveRecord::Migration[5.0]
  def change
    add_column :utsav_seats, :member, :string
  end
end
