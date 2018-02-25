class AddImageToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :image, :string
  end
end
