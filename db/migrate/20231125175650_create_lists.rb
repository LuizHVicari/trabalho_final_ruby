class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :bought
      t.date :due_date

      t.timestamps
    end
  end
end
