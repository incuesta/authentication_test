class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :name
      t.string :picture
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
