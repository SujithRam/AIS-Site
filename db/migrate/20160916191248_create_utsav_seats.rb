class CreateUtsavSeats < ActiveRecord::Migration[5.0]
  def change
    create_table :utsav_seats do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :grpdetails
      t.string :group

      t.timestamps
    end
  end
end
