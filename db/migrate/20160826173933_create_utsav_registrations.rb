class CreateUtsavRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :utsav_registrations do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :typeofpart
      t.string :grpdetails
      t.string :group
      t.string :otheractiv

      t.timestamps
    end
  end
end
