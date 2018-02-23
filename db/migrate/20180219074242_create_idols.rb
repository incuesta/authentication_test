class CreateIdols < ActiveRecord::Migration[5.1]
  def change
    create_table :idols do |t|
      t.string :last_name
      t.string :first_name

      t.timestamps
    end
  end
end
