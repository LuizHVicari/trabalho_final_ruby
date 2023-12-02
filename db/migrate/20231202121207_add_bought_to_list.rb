class AddBoughtToList < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :bought, :boolean, default: false
  end
end
