class AddPeopleToUtsavSeat < ActiveRecord::Migration[5.0]
  def change
    add_column :utsav_seats, :people, :integer
  end
end
