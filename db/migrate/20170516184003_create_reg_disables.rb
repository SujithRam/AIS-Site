class CreateRegDisables < ActiveRecord::Migration[5.0]
  def change
    create_table :reg_disables do |t|
      t.string :studentreg
      t.string :utsavseatreg
      t.string :utsavpartreg

      t.timestamps
    end
  end
end
