class AddConfirmationToUtsavSeat < ActiveRecord::Migration[5.0]
  def change
    add_column :utsav_seats, :confirmation, :string
  end
end
