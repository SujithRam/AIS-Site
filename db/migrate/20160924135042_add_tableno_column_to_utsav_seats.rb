class AddTablenoColumnToUtsavSeats < ActiveRecord::Migration[5.0]
  def change
    add_column :utsav_seats, :tableno, :string
  end
end
