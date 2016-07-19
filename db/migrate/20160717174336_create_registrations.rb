class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.string :name
      t.string :email
      t.string :fmlocation
      t.string :flightno
      t.string :password_digest
      t.datetime :landingtime
      t.string :needpickup
      t.string :needaccom

      t.timestamps
    end
  end
end
