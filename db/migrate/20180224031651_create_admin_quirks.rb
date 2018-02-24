class CreateAdminQuirks < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_quirks do |t|
      t.string :fave_idol
      t.references :admin

      t.timestamps
    end
  end
end
