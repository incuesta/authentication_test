class CreateTalents < ActiveRecord::Migration[5.1]
  def change
    create_table :talents do |t|
    	t.references :idol
      	t.string :description
      	t.timestamps
    end
  end
end
