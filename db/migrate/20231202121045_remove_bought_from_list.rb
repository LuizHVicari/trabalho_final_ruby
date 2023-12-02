class RemoveBoughtFromList < ActiveRecord::Migration[7.0]
  def change
    remove_column :lists, :bought, :boolean
  end
end
