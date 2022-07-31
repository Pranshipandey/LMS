class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string :role
      t.integer :book_count
      t.string :mname
      t.string :titile
      t.datetime :issued_at

      t.timestamps
    end
  end
end
